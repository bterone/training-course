document.addEventListener("turbolinks:load", function() {
    $(".sortable").sortable({
        connectWith: ".sortable",
        start: function ( event, ui ) {
            console.log('START')
        },
        receive: function ( event, ui ) {
            console.log(ui.item.get(0).id + ' is the ID');
            console.log($(this).attr('id') + ' is the Group ID');
        }
    });
});