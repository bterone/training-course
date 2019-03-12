document.addEventListener("turbolinks:load", function() {
    $(".sortable").sortable({
        connectWith: ".sortable",
        update: function ( event, ui ) {
            console.log('UPDATE')
        }
    });
});