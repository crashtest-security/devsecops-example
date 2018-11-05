from django.shortcuts import render


def index(request):
    context = {"name": request.POST.get("name")}
    return render(request, "index.html", context)
