from __future__ import unicode_literals

from django.db import models
from django.contrib import auth

# Create your models here.
class Question(models.Model):
	title = models.CharField(max_length=255)
	text = models.TextField()
	added_at = models.DateField()
	rating = models.IntegerField()
	author = models.OneToOneField(User)
	likes = models.ManyToManyField(User)

class QuestionManager:
	def new(self):
		return Question.objects.order_by('added_at').all()

	def popular(self):
		return Question.objects().order_by('rating').all()

class Answer(models.Model):
	text = models.TextField()
	added_at = models.DateField()
	question = models.OneToOneField(Question)
	author = models.OneToOneField(User)

class User(auth.models.User):
	pass
