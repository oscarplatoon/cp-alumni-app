from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from api.forms import CustomUserCreationForm
from api.models import User
from django.urls import reverse_lazy
from django.views import generic
from django.http import JsonResponse
import json

# Create your views here.
class SignUp(generic.CreateView):
    form_class = CustomUserCreationForm
    success_url = reverse_lazy('login')

@csrf_exempt
def signup(request):
    print(request.method)
    data = json.load(request)
    if request.method == 'POST':
        form = CustomUserCreationForm(data)
        print(data)
        if form.is_valid():
            print(form)
            return JsonResponse({'status': 'Success'}, status=200)
        return JsonResponse({'status': 'Form Not Valid'}, status=200)
    return JsonResponse({'status': 'Failed'}, status=200)
