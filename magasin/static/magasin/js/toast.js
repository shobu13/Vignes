var nom_produit;
var id_produit;
$('button#bouton_panier').click(function () {
    console.log("Toast");
    id_produit = $(this).val()
    $.get('/ajax/get_product_name_by_id', {'id_produit': id_produit}, function (data) {
        nom_produit = data['produit_nom'];
        console.log('nom produit1 :', nom_produit);
        var toastHTML = '<span>' + nom_produit + ' ajouter</span><button class="btn-flat toast-action" onclick="supr_panier(' + id_produit + ')">Supprimer</button>';
        M.toast({html: toastHTML});
    });
});