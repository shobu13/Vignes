var reponse;
$(document).ready(function () {
    var categorie_select = document.getElementById('id_categorie');
    var sous_categorie_select = document.getElementById('id_sous_categorie');
    console.log(categorie_select.options[categorie_select.selectedIndex].innerText);
    sous_categorie_select.innerHTML = '';

    $.get('/ajax/get_sous_cat', {'categorie': categorie_select.options[categorie_select.selectedIndex].innerText}, function (data) {
        console.log(data['HTTPRESPONSE']);
        reponse = data;
        if (reponse['HTTPRESPONSE'] !== 'erreur') {
            reponse['sous_categorie'].forEach(function (element) {
                console.log(element);
                sous_categorie_select.innerHTML += '<option value=' + element[0] + '>' + element[1] + '</option>';
            })
        }
        else {
            sous_categorie_select.innerHTML = '<option>---------</option>';
            console.log("set html");
        }
    });
    console.log(document.getElementById('id_categorie').innerHTML);

    $('#id_categorie').change(function () {
        $.get('/ajax/get_sous_cat', {'categorie': categorie_select.options[categorie_select.selectedIndex].innerText}, function (data) {
            console.log(data['HTTPRESPONSE']);
            reponse = data;
            sous_categorie_select.innerHTML = '<option>---------</option>';
            if (reponse['HTTPRESPONSE'] !== 'erreur') {
                reponse['sous_categorie'].forEach(function (element) {
                    console.log(element);
                    sous_categorie_select.innerHTML += '<option value=' + element[0] + '>' + element[1] + '</option>';
                })
            }
            else {
                sous_categorie_select.innerHTML = '<option>---------</option>';
                console.log("set html");
            }
        });
    });

});
