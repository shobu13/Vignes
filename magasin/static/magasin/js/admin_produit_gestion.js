let reponse;
let sous_cat = null;
$(document).ready(function () {

    if ($('#id_est_promo').prop('checked')) {
        $("label[for='id_debut_promo']").addClass('required');
        $("label[for='id_fin_promo']").addClass('required');
    }
    else {
        $("label[for='id_debut_promo']").removeClass('required');
        $("label[for='id_fin_promo']").removeClass('required');
    }

    let categorie_select = document.getElementById('id_categorie');
    let sous_categorie_select = document.getElementById('id_sous_categorie');
    let nom_produit = document.getElementById('id_nom').value;
    console.log('nom_produit ' + nom_produit);
    console.log(categorie_select.options[categorie_select.selectedIndex].innerText);
    sous_categorie_select.innerHTML = '';
    $.get('/ajax/get_default_sous_cat', {'name': nom_produit}, function (data) {
        sous_cat = data['sous_cat'];
        console.log(`sous cat = ${sous_cat}`);

        $.get('/ajax/get_sous_cat', {'categorie': categorie_select.options[categorie_select.selectedIndex].innerText}, function (data) {
            console.log(data['HTTPRESPONSE']);
            reponse = data;
            if (reponse['HTTPRESPONSE'] !== 'erreur') {
                reponse['sous_categorie'].forEach(function (element) {
                     if (element[1] === sous_cat)
                        sous_categorie_select.innerHTML += '<option selected value=' + element[0] + '>' + element[1] + '</option>';
                     else
                         sous_categorie_select.innerHTML += '<option value=' + element[0] + '>' + element[1] + '</option>';
                })
            }
            else {
                sous_categorie_select.innerHTML = '<option>---------</option>';
            }

            $('#id_categorie').change(function () {
                $.get('/ajax/get_sous_cat', {'categorie': categorie_select.options[categorie_select.selectedIndex].innerText}, function (data) {
                    console.log(data['HTTPRESPONSE']);
                    reponse = data;
                    sous_categorie_select.innerHTML = '<option>---------</option>';
                    if (reponse['HTTPRESPONSE'] !== 'erreur') {
                        reponse['sous_categorie'].forEach(function (element) {
                            sous_categorie_select.innerHTML += '<option value=' + element[0] + '>' + element[1] + '</option>';
                        })
                    }
                    else {
                        sous_categorie_select.innerHTML = '<option>---------</option>';
                    }
                });
            });
        });

    });

    $('#id_est_promo').change(function () {
        if ($(this).prop('checked')) {
            $("label[for='id_debut_promo']").addClass('required');
            $("label[for='id_fin_promo']").addClass('required');
        }
        else {
            $("label[for='id_debut_promo']").removeClass('required');
            $("label[for='id_fin_promo']").removeClass('required');
        }
    })

});
