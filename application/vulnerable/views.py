from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def index(request):
    context = {"name": request.POST.get("name")}
    return render(request, "index.html", context)
