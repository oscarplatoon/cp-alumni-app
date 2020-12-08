from django.db import models
from django.conf import settings
from django.contrib.auth.models import AbstractUser

class Cohort(models.Model):
  platoon = models.CharField(max_length=50)
  current_cohort = models.BooleanField(default=False)

  def __str__(self):
    return f"{self.platoon}"

class User(AbstractUser):
  email = models.EmailField(
    verbose_name='email address',
    max_length=255,
    unique=True,
    )
  is_verified = models.BooleanField(default=False)
  cohort = models.ForeignKey(Cohort, on_delete=models.CASCADE, related_name='cohorts', null=True, blank=True)
  current_company = models.CharField(max_length=100, blank=True, null=True)
  username = None
  USERNAME_FIELD = 'email'
  REQUIRED_FIELDS = []


class Raffle(models.Model):
  is_active = models.BooleanField(default=False)
  amount = models.DecimalField(max_digits=6, decimal_places=2, blank=True, null=True)
  name = models.CharField(max_length=20)

  def __str__(self):
    return f"{self.name} is active: {self.is_active}."

class RaffleParticipant(models.Model):
  raffle = models.ForeignKey(Raffle, on_delete=models.CASCADE, related_name='raffle_participants')
  email = models.EmailField(max_length=255)
  name = models.CharField(max_length=100)
  tickets = models.IntegerField()

  def __str__(self):
    return f"{self.name}, Tickets: {self.tickets} for {self.raffle.name} raffle"


