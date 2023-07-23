
from django.contrib import admin
from django.urls import path, include
from reels import views
from reels.views import TemplateByCategory,MakeVideo,Search,LikeTemplate
from rest_framework.routers import DefaultRouter
from django.conf import settings
from django.conf.urls.static import static


router = DefaultRouter()
router.register('categories', views.viewsets_category)
router.register('templates', views.viewsets_template)
router.register('animations', views.viewsets_animation)
router.register('frames', views.viewsets_frame)

urlpatterns = [
    path('admin/', admin.site.urls),
    path('rest/', include(router.urls)),
    path('make-video', MakeVideo.as_view()),
    path('templates/', Search.as_view()),
    path('likes', LikeTemplate.as_view()),
    path('templates-by-category', TemplateByCategory.as_view()),
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
