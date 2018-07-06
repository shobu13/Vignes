from django import template

register = template.Library()


@register.filter
def get_element(dico, key):
    return dico[key]
