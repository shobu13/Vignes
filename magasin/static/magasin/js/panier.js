$('button#bouton_panier').click(function () {
    console.log($(this).val());
    $.get('/ajax/add_cart', {'id': $(this).val()}, function (data) {
        document.getElementById('nb_prod').innerText = data['total'];
        document.getElementById('nb_prod_mobile').innerText = data['total'];
        console.log(data['HTTPRESPONSE']);
    });
});

$('#bouton_panier_reset').click(function () {
    $.get('/ajax/clear_cart', {}, function (data) {
        document.getElementById('nb_prod').innerText = 0;
        console.log(data['HTTPRESPONSE']);
    });
    window.location.reload();
});


$('button#bouton_panier_supr').click(function () {
    console.log("supr");
    console.log($(this).val());
    supr_panier($(this).val());
    window.location.reload();
});

function supr_panier(id_val)
{
    $.get('/ajax/supr_cart', {'id': id_val}, function (data) {
        document.getElementById('nb_prod').innerText = data['total'];
        console.log(data['total']);
        console.log(data['HTTPRESPONSE']);
    });
    M.Toast.dismissAll();
}