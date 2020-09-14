from django.db import models
from django.conf import settings
from django.contrib.auth.models import AbstractUser

class Cohort(models.Model):
  platoon = models.CharField(max_length=50)

  def __str__(self):
    return f"{self.platoon}"

class User(AbstractUser):
  email = models.EmailField(
    verbose_name='email address',
    max_length=255,
    unique=True,
    )
  is_verified = models.BooleanField(default=False)
  cohort = models.ForeignKey(Cohort, on_delete=models.CASCADE, related_name='cohorts', blank=True, null=True)
  username = None
  USERNAME_FIELD = 'email'
  REQUIRED_FIELDS = []


class UserInfo(models.Model):
  user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='users')
  current_company = models.CharField(max_length=100)

  def __str__(self):
    return f"{self.user.first_name} {self.user.last_name} is at {self.current_company}."

