from django.shortcuts import render
from reels.serializers import LikeSerializer,AnimationSerializer, CategorySerializer, FrameSerializer, TemplateSerializer
from rest_framework import viewsets,generics
from reels.models import Animation, Category, Frame, Template,Like
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.pagination import PageNumberPagination
from django.db.models import Q
from rest_framework.parsers import MultiPartParser
import os
import shutil
import moviepy.editor as mp
# Create your views here.
def simple(path,name,time,size=(720, 1280)):
    clip1 =  mp.ImageClip(path).set_fps(24).set_duration(time).resize(size)
    clip1.write_videofile(f"{name}.mp4")
    return f"{name}.mp4"
def zoomIn(path,name,time,size=(720, 1280)):
    rad=0.11*4/time
    slide = mp.ImageClip(path).set_fps(24).set_duration(time).resize(size)
    slide = slide.resize(lambda t: 1 + rad * t)  # + for Zoom-in effect /- for Zoom-out
    slide = slide.set_position(('center', 'center'))
    slide = mp.CompositeVideoClip([slide], size=size)
    slide.write_videofile(f'{name}.mp4')
    return f"{name}.mp4"
def zoomOut(path,name,time):
    rad=0.13*4/time
    slide = mp.ImageClip(path).set_fps(24).set_duration(time).resize((1080, 1920))
    slide = slide.resize(lambda t: 1 / (1 + rad * t))  # + for Zoom-in effect /- for Zoom-out
    slide = slide.set_position(('center', 'center'))
    slide = mp.CompositeVideoClip([slide], size=(720, 1280))
    slide.write_videofile(f'{name}.mp4')
    return f"{name}.mp4"
    
def animation(anime_id, path, name, time):
    if anime_id == 1:
        return simple(path, name, time)
    elif anime_id == 2:
        return zoomIn(path, name, time)
    elif anime_id == 3:
        return zoomOut(path, name, time)
    else:
        return simple(path, name, time)
        
def videoWithoutAudio(path):
    video = mp.VideoFileClip(path)
    video = video.without_audio()
    video.write_videofile(path)
    return path
def resize(path):
    clip = mp.VideoFileClip(path)
    resized_clip = clip.resize(height=1280)
    resized_clip.write_videofile(path)
    return path
def cropVideo(videopath,time,path,i):
    # loading video dsa gfg intro video 
    clip = mp.VideoFileClip(videopath)
    crop=True
    X1=0
    X2=clip.w
    Y1=0
    Y2=clip.h
    if clip.w==720 and clip.h==1280:
        crop=False
    elif clip.w*1.77777777778>clip.h:
        a=clip.h/1280
        b=720*a
        c=abs(clip.w-b)
        d=c/2
        X1=int(d)
        X2=int(b+X1)
    elif clip.w*1.77777777778<clip.h:
        a=clip.w/720
        b=1280*a
        c=abs(clip.h-b)
        d=c/2
        Y1=int(d)
        Y2=int(b+Y1)
    else:
        crop=False
        if clip.duration > time:
            clip = clip.subclip(0, time)
        final=clip
    if crop:
        if clip.duration > time:
            clip = clip.subclip(0, time)
        final=clip.crop(x1=X1, y1=Y1,x2=X2, y2=Y2)
    newPath=f'{path}/new{i}.mp4'
    final.write_videofile(newPath)
    return newPath
def mergeVideos(data,music,path_name):
    video_clips=[]
    for path in data:
        clip = mp.VideoFileClip(path)
        resized_clip = clip.resize(height=1280)
        video_clips.append(resized_clip)
    merged_video = mp.concatenate_videoclips(video_clips,method='compose')
    audio = mp.AudioFileClip(f"media/{music}")
    merged_video=merged_video.without_audio()
    final_video = merged_video.set_audio(audio)
    final_video.write_videofile(path_name, codec="libx264")
    return path_name
class viewsets_category(viewsets.ModelViewSet):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer

class viewsets_template(viewsets.ModelViewSet):
    queryset = Template.objects.all()
    serializer_class = TemplateSerializer

class viewsets_animation(viewsets.ModelViewSet):
    queryset = Animation.objects.all()
    serializer_class = AnimationSerializer

class viewsets_frame(viewsets.ModelViewSet):
    queryset = Frame.objects.all()
    serializer_class = FrameSerializer
#make video from template by sending user_id, template id, and files with order
class MakeVideo(APIView):
    data=[]
    def post(self, request, format=None):
        id=request.data.get('template')
        user=request.data.get('user')
        # Process each file and save them
        self.data=[]
        path=f'media/videos/{user}'
        if os.path.exists(path):
            shutil.rmtree(path)  # Delete the folder and its contents
        os.makedirs(path)
        #---------- get template ----------
        try:
            template = Template.objects.get(pk=id)
        except Template.DoesNotExist:
            return Response({'message': 'template not found'}, status=404)
        try:
            frames=Frame.objects.filter(template__id=id)
        except Frame.DoesNotExist:
            return Response({'message': 'Template not found'}, status=404)
        times=[]
        for frame in frames:
            times.append([frame.time,frame.animation,frame.isImage])
        # save all files
        for i in range(len(frames)):
            files=request.FILES.getlist(f'file{i}')
            for file in files:
                # Define the path where you want to save the file
                extension = os.path.splitext(file.name)[1]
                file.name=f'{i}{extension}'
                file_path = os.path.join(path, file.name)
                # Save the file to the specified path
                with open(file_path, 'wb') as destination:
                    for chunk in file.chunks():
                        destination.write(chunk) 
            if(times[i][2]==True):# isImage
                image_name=f'{path}/{i}{extension}'
                video_name=animation(times[i][1].id,image_name,f'{path}/{i}',times[i][0])
                self.data.append(video_name)
            else :
                video_name=f'{path}/{i}{extension}'
                video_name=cropVideo(video_name,times[i][0],path,i)
                self.data.append(video_name)
        final=mergeVideos(self.data,template.music_url,f"{path}/final.mp4")
        return Response({f'url': f'{final}'})  
    def get(self,request):
        id=request.query_params.get('id')
        return Response({'message': f'get method {id}'})  

# searcg template by name or music_name 
class Search(generics.ListAPIView):
    queryset = Template.objects.all()
    serializer_class = TemplateSerializer

    def get_queryset(self):
        search_term = self.request.query_params.get('search', '')
        queryset = super().get_queryset()
        
        if search_term:
            queryset = queryset.filter(
                Q(name__icontains=search_term) | Q(music_name__icontains=search_term)
            )
        return queryset
# make my favorites templates and get my favorites 
class LikeTemplate(APIView):
    def post(self,request):
        user_id=request.data.get('user')
        template_id=request.data.get('template')

        modified_data = {
            'user_id': user_id,
            'template': template_id
        }
        serializer = LikeSerializer(data=modified_data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=201)
        return Response(serializer.errors, status=400)
    def get(self,request):
        user_id=request.query_params.get('user')
        templates = Template.objects.filter(like__user_id=user_id)
        serializer = TemplateSerializer(templates, many=True)
        return Response(serializer.data)
    def delete(self, request):
        user_id = request.data.get('user')
        template_id = request.data.get('template')

        # Get the like object to delete
        like = Like.objects.filter(user_id=user_id, template_id=template_id).first()

        if like:
            like.delete()
            return Response(status=204)
        else:
            return Response({'error': 'Like not found.'}, status=404)
# to use pagination add this request ?category=value&page=1&page_size=10

class TemplateByCategory(APIView):
    def get(self, request):
        category_id = request.query_params.get('category')
        templates = Template.objects.filter(category__id=category_id)

        # Get the page size from the request parameters or use the default value
        page_size = int(request.query_params.get('page_size', 10))

        # Instantiate the pagination class
        paginator = PageNumberPagination()
        paginator.page_size = page_size

        # Paginate the queryset
        paginated_templates = paginator.paginate_queryset(templates, request)

        serializer = TemplateSerializer(paginated_templates, many=True)

        # Return the paginated response
        return paginator.get_paginated_response(serializer.data)