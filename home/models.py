from django.db import models

# Create your models here.
class MyFamilyMember(models.Model):
    number = models.CharField(max_length=4)
    name = models.CharField(max_length=10)
    relation = models.CharField(max_length=10, blank = True)
    job = models.CharField(max_length=10)
    both = models.CharField(max_length=10)
    class Meta:
        ordering = ('both', )
    def __str__(self):
        return self.name
