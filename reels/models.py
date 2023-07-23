from django.db import models

# Create your models here.

class Category(models.Model):
    name=models.CharField(max_length=50)
    def __str__(self):
        return self.name

class Animation(models.Model):
    name=models.CharField(max_length=50)
    video=models.FileField(upload_to='animations/',blank=True)
    def __str__(self):
        return self.name
class Template(models.Model):
    name=models.CharField(max_length=50)
    music_name=models.CharField(max_length=50)
    music_url=models.FileField(upload_to='music/',max_length=255)
    frame_nbr=models.IntegerField()
    time=models.FloatField()
    video_url=models.FileField(upload_to='templates/')
    category= models.ForeignKey(Category, on_delete=models.CASCADE,related_name="templates")
    def __str__(self):
        return self.name
class Frame(models.Model):
    isImage=models.BooleanField(default=True)
    time=models.FloatField()
    fixe=models.BooleanField(default=False)
    url=models.FileField(upload_to='frames/',blank=True)
    template=models.ForeignKey(Template,related_name='frames',on_delete=models.CASCADE,null=True)
    animation= models.ForeignKey(Animation, on_delete=models.CASCADE,related_name='frames',null=True)

class Like(models.Model):
    user_id=models.TextField()
    template=models.ForeignKey(Template,related_name='like',on_delete=models.CASCADE,null=True)
