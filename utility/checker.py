def session_variable_check(request):
    try:
        print('produit ok')
        request.session['produits']
    except:
        print('produit fail')
        request.session['produits'] = {}
    try:
        print('total ok')
        request.session['total']
    except:
        print('total fail')
        request.session['total'] = 0
