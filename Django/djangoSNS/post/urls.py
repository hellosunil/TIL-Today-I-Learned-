from django.urls import path
from .views import *
from .models import Post

app_name = 'post'

urlpatterns = [
    path('', post_list, name='post_list'),
    path('detail/<int:id>/', post_detail, name='post_detail'),
]