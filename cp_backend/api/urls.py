from django.urls import path, include
from . import views

urlpatterns = [
    path('current_user/', views.current_user, name='current_user'),
    path('users/', views.UserList.as_view()),
    path('get_user_count/', views.UserList.as_view()),
    path('active_raffle/', views.RaffleList.as_view()),
]
