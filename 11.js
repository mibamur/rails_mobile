$('#new_dohod').validate({
    rules: {
        dohod_rab_id: {
            required: true
        }
    },
    messages: {
        dohod_rab_id: {
            required: "Надо выбрать."
        }
    },
    errorPlacement: function (error, element) {
        error.appendTo(element.parent().prev());
    },
    submitHandler: function (form) {
        $.mobile.changePage('#success', {
            transition: "none"
        });
        return false;
    }
});
