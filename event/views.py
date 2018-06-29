from django.shortcuts import render

from event.models import Event


def home(request):
    event_liste = Event.objects.all()
    year_liste = []
    for event in event_liste:
        year = event.date.year
        if year not in year_liste:
            year_liste.append(year)
        year_liste.reverse()
    return render(request, 'event/event_home.html', locals())
