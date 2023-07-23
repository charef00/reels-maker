from rest_framework import serializers
from reels.models import *



class AnimationSerializer(serializers.ModelSerializer):
    class Meta:
        model=Animation
        fields='__all__'
class FrameSerializer(serializers.ModelSerializer):
    class Meta:
        model=Frame
        fields=['id','isImage','time','fixe','url','animation','template']
    depth=1
class TemplateSerializer(serializers.ModelSerializer):
    frames = FrameSerializer(many=True, read_only=True)
    class Meta:
        model=Template
        fields=['id','name','music_name','music_url'
                ,'frame_nbr','time','video_url','frames']
     
class CategorySerializer(serializers.ModelSerializer):
    templates = TemplateSerializer(many=True, read_only=True)
    class Meta:
        model=Category
        fields=['id','name','templates']
class LikeSerializer(serializers.ModelSerializer):
    class Meta:
        model=Like
        fields=['id','user_id','template']
    depth=1
        