from django.shortcuts import render

from event.models import Event


def home(request):
    event_liste = Event.objects.all()
    date_liste = {}
    for event in event_liste:
        date_liste[event.date.year] = []
    for event in event_liste:
        if event.date.month not in date_liste[event.date.year]:
            date_liste[event.date.year].append(event.date.month)
    return render(request, 'event/event_home.html', locals())


def detail(request, event_id):
    event = Event.objects.get(id=event_id)
    event_image = event.eventimage_set.all()
    return render(request, 'event/event_detail.html', locals())
