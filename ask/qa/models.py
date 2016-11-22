from __future__ import unicode_literals

from django.db import models
from django.contrib.auth.models import User


# Create your models here.
class QuestionManager(models.Manager):	
	def new(self):
		return Question.objects.order_by('added_at').all()

	def popular(self):
		return Question.objects().order_by('rating').all()


class Question(models.Model):
	objects = QuestionManager()

	title = models.CharField(max_length=255)
	text = models.TextField()
	added_at = models.DateField(auto_now_add=True)
	rating = models.IntegerField(blank=True, null=True)
	author = models.ForeignKey(User)
	likes = models.ManyToManyField(User, related_name='question_author')


class Answer(models.Model):
	text = models.TextField()
	added_at = models.DateField()
	question = models.OneToOneField(Question)
	author = models.ForeignKey(User)
