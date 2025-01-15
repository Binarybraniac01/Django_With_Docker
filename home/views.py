from django.shortcuts import render


def home_view(request):
    print("Server started...")
    return render(request, "index.html",{})
