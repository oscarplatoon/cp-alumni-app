from django.contrib import admin
from .models import Cohort, User, UserInfo
# Register your models here.

my_models = [Cohort, User, UserInfo]
admin.site.register(my_models)
