from django.contrib import admin
from .models import Cohort, User, Raffle, RaffleParticipant
# Register your models here.

my_models = [Cohort, User, Raffle, RaffleParticipant]
admin.site.register(my_models)
