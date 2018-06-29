from django.contrib import admin

from event.models import *


class EventImageInline(admin.TabularInline):
    model = EventImage
    extra = 3


class EventAdmin(admin.ModelAdmin):
    inlines = [EventImageInline, ]


admin.site.register(Event, EventAdmin)
admin.site.register(EventType)
