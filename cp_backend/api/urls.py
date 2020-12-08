from django.urls import path, include
from . import views

urlpatterns = [
    path('current_user/', views.current_user, name='current_user'),
    path('users/', views.UserList.as_view()),
    path('user/update/', views.UserDetail.as_view()),
    path('cohorts/', views.CohortList.as_view()),
    path('get_all_users/', views.AllUsersList.as_view()),
    path('active_raffle/', views.RaffleList.as_view()),
    path('create-session/', views.create_checkout_session, name='create_checkout_session'),
    path('checkout/success=true', views.payment_success, name='payment_success'),
    path('checkout/canceled=true', views.payment_cancel, name='payment_cancel'),
]
