$(document).ready(function () {
    let notAllButton = $('#notAllButton');
    let userForm = $('.select-dropdown')[0];
    userForm.setAttribute('disabled', '');
    $('input[type="radio"]').click(function () {
        if (notAllButton.is(':checked')) {
            userForm.removeAttribute('disabled');
        }
        else {
            userForm.setAttribute('disabled', '');
        }
    });
});