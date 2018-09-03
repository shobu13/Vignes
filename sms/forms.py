from django import forms

from user.models import User


class ListUser(forms.Form):
    users = forms.ModelMultipleChoiceField(queryset=User.objects.exclude(username='admin'),
                                           required=False)
