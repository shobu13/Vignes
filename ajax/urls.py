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

from ajax import views

urlpatterns = [
    path('get_sous_cat', views.get_sous_cat),
    path('add_cart', views.add_cart),
    path('clear_cart', views.clear_cart, name='clear_cart'),
    path('supr_cart', views.supr_cart, name='supr_cart'),
    path('get_cat', views.get_cat, name='get_cat'),
    path('call_checker', views.call_checker, name='call_checker'),
    path('get_product_name_by_id', views.get_product_name_by_id, name='get_product_name_by_id'),
    path('reset_filter', views.reset_filter, name='reset_filter'),
]
