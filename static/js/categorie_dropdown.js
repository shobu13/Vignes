$(document).ready(function () {
    let cat_dropdown_classic_alcool = $('#dropdown_classic_alcool');
    let cat_dropdown_classic_epicerie_fine = $('#dropdown_classic_epicerie_fine');
    let cat_dropdown_classic_mobile_alcool = $('#dropdown_mobile_alcool');
    let cat_dropdown_classic_mobile_epicerie_fine = $('#dropdown_mobile_epicerie_fine');
    $.get('/ajax/get_cat', {'type': 'alcool'}, function (data) {
        console.log(data['HTTPRESPONSE']);
        let reponse = data['liste_cat'];
        reponse.forEach(function (categorie) {
            cat_dropdown_classic_alcool.append("<li><a href=/magasin/" + categorie[0] + ">" + categorie[1] + "</li>");
            cat_dropdown_classic_mobile_alcool.append("<li><a href=/magasin/" + categorie[0] + ">" + categorie[1] + "</li>");
        })
    });
    $.get('/ajax/get_cat', {'type': 'fine'}, function (data) {
        console.log(data['HTTPRESPONSE']);
        let reponse = data['liste_cat'];
        reponse.forEach(function (categorie) {
            cat_dropdown_classic_epicerie_fine.append("<li><a href=/magasin/" + categorie[0] + ">" + categorie[1] + "</li>");
            cat_dropdown_classic_mobile_epicerie_fine.append("<li><a href=/magasin/" + categorie[0] + ">" + categorie[1] + "</li>");
        })
    });
});