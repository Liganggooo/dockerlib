from django.urls import path
from . import views
app_name = 'home'
urlpatterns = [
    path('homepage/', views.homepage, name = 'homepage'),
]
