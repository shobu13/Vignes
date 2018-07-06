$(document).ready(function () {
    $('li#event_list').click(function () {
        let span_data = $(this).find('span')[0].id.split('-');
        console.log(span_data);
        let month = span_data[2];
        let year = span_data[1];
        $.get('/ajax/get_event_by_year_and_month', {'year': year, 'month': month}, function (data) {
            console.log(data['HTTPRESPONSE']);
            let data_element = document.getElementById(`data-${year}-${month}`);
            display_cards(Object.entries(data['event_list']), data_element);
        });
    });
});

function display_cards(events, DOM_element) {
    let text = ``;
    console.log(events);
    events.forEach(function (event) {
        text += `<a href="/event/detail/${event[1]['id']}">
                <div class="card hoverable black-text">
                    <div class="card-content">
                        <span class="card-title">${event[1]['nom']}</span>
                        <p>${event[1]['date']} à ${event[1]['heure']}</p>
                        <hr/>
                        <p><u>${event[1]['type_nom']} à ${event[1]['lieu']}</u></p>
                        ${event[1]['description']}
                    </div>
                </div>
            </a>`;
    });
    DOM_element.innerHTML = text;
}