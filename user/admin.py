from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import User


class UserAdminCustom(UserAdmin):
    UserAdmin.fieldsets += (
                               'Détails', {
                                   'fields': ('code_postal', )
                               }),


admin.site.register(User, UserAdminCustom)
