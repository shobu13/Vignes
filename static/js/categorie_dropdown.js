$(document).ready(function () {
    cat_dropdown = $('#dropdown1')
    $.get('/ajax/get_cat', {}, function (data) {
        console.log(data['HTTPRESPONSE']);
        reponse = data['liste_cat'];
        reponse.forEach(function (categorie) {
        cat_dropdown.append("<li><a href=/magasin/" + categorie[0] + ">" + categorie[1] + "</li>");
        })
    });
})