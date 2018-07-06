from django import template

register = template.Library()


@register.filter
def reverse_dict(dico):
    return sorted(dico, reverse=True)


@register.filter
def month_to_litteral(digit):
    if digit == 1:
        return "Janvier"
    elif digit == 2:
        return "Février"
    elif digit == 3:
        return "Mars"
    elif digit == 4:
        return "Avril"
    elif digit == 5:
        return "Mai"
    elif digit == 6:
        return "Juin"
    elif digit == 7:
        return "Juillet"
    elif digit == 8:
        return "Août"
    elif digit == 9:
        return "Septembre"
    elif digit == 10:
        return "Octobre"
    elif digit == 11:
        return "Novembre"
    elif digit == 12:
        return "Décembre"
