from django.contrib import admin

from website.models import *


class CardImageInline(admin.TabularInline):
    model = CardImage
    extra = 1


class AcceuilCardAdmin(admin.ModelAdmin):
    inlines = [CardImageInline, ]


admin.site.register(AcceuilCard, AcceuilCardAdmin)
admin.site.register(Diver)
admin.site.register(BoutiqueImage)
