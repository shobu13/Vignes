"""vignes.magasin URL Configuration

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

from magasin import views

urlpatterns = [
    path('', views.home, name='magasinHome'),
    path('panier', views.panier, name='magasinPanier'),
    path('resume_commande', views.resume_commande, name='resumeCommande'),
    path('payement_commande', views.payement_commande, name='payementCommande'),
    path('payement_commande_ok', views.payement_commande_ok, name='payementCommandeOk'),
    path('payement_commande_error', views.payement_commande_error, name='payementCommandeError'),

]
