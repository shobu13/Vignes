$(document).ready(function () {
    $('div[class="collapsible-header"]').click(function () {
        let year = this.innerText;
        $.get('/ajax/get_event_by_year', {'year': year}, function (data) {
            console.log(data['HTTPRESPONSE']);
            let data_element = document.getElementById('data-' + year);
            Object.entries(data['event_list']).forEach(function (element) {
                data_element.innerHTML = display_card(element[1]);
            });
        });
    });
});

function display_card(event) {
    return `<a href="#!">
                <div class="card hoverable black-text">
                    <div class="card-content">
                        <span class="card-title">${event['nom']}</span>
                        ${event['description']}
                    </div>
                </div>
            </a>`;
}