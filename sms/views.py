from django.shortcuts import render, redirect, Http404

import nexmo
import xlrd

from sms.forms import ListUser
from user.models import User
from vignes import settings


# Create your views here.

def home(request):
    if not request.user.is_superuser:
        return redirect('/')
    form = ListUser(None)
    return render(request, 'sms/sms_home.html', locals())


def envoie(request):
    if not request.POST:
        raise Http404
    form = ListUser(request.POST)
    if form.is_valid():
        print(form.cleaned_data)
        is_all = request.POST.get("isAll")
        message = request.POST.get("message")
        users = form.cleaned_data.get('users')
        if is_all == 'True':
            users = User.objects.exclude(username='Admin')
    else:
        return redirect('/admin/sms')
    client = nexmo.Client(key=settings.NEXMO_API_KEY, secret=settings.NEXMO_API_SECRET)
    for user in users:
        msg = client.send_message({
            'from': settings.NEXMO_DEFAULT_FROM,
            'to': '+33{}'.format(user.phone_number[1:]),
            'text': message
        })
        print("retour= ", msg)
    return render(request, 'sms/sms_envoie.html', locals())


def excel(request):
    file_name = str(request.FILES['tableur'])
    num_liste = []
    message = request.POST.get('message')
    with open(file_name, 'wb+') as destination:
        for chunk in request.FILES['tableur'].chunks():
            destination.write(chunk)
    fichier = xlrd.open_workbook(file_name)
    for sheet in fichier.sheets():
        for number in sheet.col_values(2):
            if number:
                try:
                    num_liste.append(str(int(number)))
                except ValueError:
                    pass
    print(num_liste)
    client = nexmo.Client(key=settings.NEXMO_API_KEY, secret=settings.NEXMO_API_SECRET)
    for number in num_liste:
        msg = client.send_message({
            'from': settings.NEXMO_DEFAULT_FROM,
            'to': '+33{}'.format(number),
            'text': message
        })
        print("retour= ", msg)

    raise Http404
