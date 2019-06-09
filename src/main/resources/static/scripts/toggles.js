//Toggles
$(function () {$('[data-toggle="popover"]').popover()});
$(function () {$('[data-toggle="tooltip"]').tooltip()});
feather.replace();

//Show password
$(".input-password").click(function () {
    $(this).toggleClass("fa-eye fa-eye-slash");
    var input = $($(this).attr("toggle"));
    if (input.attr("type") == "password") {
        input.attr("type", "text");
    } else {
        input.attr("type", "password");
    }
});