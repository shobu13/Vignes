from django.shortcuts import render, redirect, Http404

import nexmo

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
        users = form.cleaned_data.get('users')
        if is_all == 'True':
            users = User.objects.all()
    else:
        return redirect('/admin/sms')
    client = nexmo.Client(key=settings.NEXMO_API_KEY, secret=settings.NEXMO_API_SECRET)
    client.send_message({
        'from': settings.NEXMO_DEFAULT_FROM,
        'to': '+33782387918',
        'text': 'A text message sent using the Nexmo SMS API',
    })

    return render(request, 'sms/sms_envoie.html', locals())