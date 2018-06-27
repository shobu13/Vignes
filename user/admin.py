from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import User


class UserAdminCustom(UserAdmin):
    UserAdmin.fieldsets += (
                               'Détails', {
                                   'fields': ('rue', 'ville', 'code_postal', 'phone_number', )
                               }),


admin.site.register(User, UserAdminCustom)
