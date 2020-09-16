from django.contrib import admin
from .models import Cohort, User, UserInfo, Raffle, RaffleParticipant
# Register your models here.

my_models = [Cohort, User, UserInfo, Raffle, RaffleParticipant]
admin.site.register(my_models)
