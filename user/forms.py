"""module contenant les formulaires utilisé par django."""
from django import forms

from user.models import User


class UserForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ('username', 'password', 'confirm_password', 'first_name', 'last_name', 'email', 'code_postal', )
        widgets = {
            'password': forms.PasswordInput(),
            'confirm_password': forms.PasswordInput(),
        }
