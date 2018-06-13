$(document).ready(function () {
    cat_dropdown_classic = $('#dropdown_classic');
    cat_dropdown_classic_mobile = $('#dropdown_mobile');
    $.get('/ajax/get_cat', {}, function (data) {
        console.log(data['HTTPRESPONSE']);
        reponse = data['liste_cat'];
        reponse.forEach(function (categorie) {
        cat_dropdown_classic.append("<li><a href=/magasin/" + categorie[0] + ">" + categorie[1] + "</li>");
        cat_dropdown_classic_mobile.append("<li><a href=/magasin/" + categorie[0] + ">" + categorie[1] + "</li>");
        })
    });
})