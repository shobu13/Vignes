"""vignes.website URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.urls import path

from website import views

urlpatterns = [
    path('', views.home, name='website_home'),
    path('panier', views.panier, name='website_panier'),
    path('resume_commande', views.resume_commande, name='resume_commande'),
    path('payement_commande', views.payement_commande, name='payement_commande'),
    # path('paymill_confirm', views.view1, name='paymill_confirm'),

]
