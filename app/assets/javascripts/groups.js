document.addEventListener("turbolinks:load", function() {
    $(".sortable").sortable({
        connectWith: ".sortable"
    });
});