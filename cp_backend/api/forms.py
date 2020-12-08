from django import forms
from django.contrib.auth.forms import UserCreationForm
from .models import User
from django.urls import reverse_lazy


class CustomUserCreationForm(UserCreationForm):
    class Meta(UserCreationForm):
        model = User
        fields = ('id','first_name', 'last_name', 'email', 'password')

