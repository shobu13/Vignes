$('button#bouton_panier').click(function () {
        console.log($(this).val());
        $.get('/ajax/add_cart', {'id': $(this).val()}, function (data) {
            document.getElementById('nb_prod').innerText = data['total'];
            console.log(data['HTTPRESPONSE']);
        })
    })

    $('#bouton_panier_reset').click(function () {
        $.get('/ajax/clear_cart', {}, function (data) {
            document.getElementById('nb_prod').innerText = 0;
            console.log(data['HTTPRESPONSE']);
        })
    })

/*
    $('button#bouton_panier_supr').click(function () {
        console.log($(this).val());
        $.get('/ajax/supr_cart', {'id': $(this).val()}, function (data) {
            document.getElementById('nb_prod').innerText = data['total'];
            console.log(data['HTTPRESPONSE']);
        })
    })*/
