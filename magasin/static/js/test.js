var reponse;
$(document).ready(function () {
    var categorie_select = document.getElementById('id_categorie');
    var sous_categorie_select = document.getElementById('id_sous_categorie');
    console.log(categorie_select.options[categorie_select.selectedIndex].innerText);
    sous_categorie_select.innerHTML = '<option>---------</option>';
    console.log(document.getElementById('id_categorie').innerHTML);
    $('#id_categorie').change(function () {
        $.get('/', {'categorie': categorie_select.options[categorie_select.selectedIndex].innerText}, function (data) {
            console.log(data['HTTPRESPONSE']);
            reponse = data['HTTPRESPONSE'];
            if (reponse !== 'erreur') {
                reponse.forEach(function (element) {
                    console.log(element);
                    sous_categorie_select.innerHTML += '<option value='+ element.id +'>'+ element +'</option>';
                })
            }
            else {
                sous_categorie_select.innerHTML = '<option>---------</option>';
                console.log("set html");
            }
        });
    });
});
