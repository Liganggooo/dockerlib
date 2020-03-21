from django.shortcuts import render
from .models import MyFamilyMember
# Create your views here.
def homepage(request):
	members = MyFamilyMember.objects.all()
	context = {'members': members}
	return render(request, 'home/home.html', context)
