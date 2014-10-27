// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
// require turbolinks
// require_tree .
//= require index
//= require jquery.mobile
//= require jqm-demos
//= require dialog.build
//= require tablesaw
// require jquery.validationEngine-ru_RU
// require jquery.validationEngine

var ready;
ready = function() {
    //$('select.dohod_select option[value="1"]').attr("selected",true);
    //$('select.rashod_select option[value="1"]').attr("selected",true);
    //$('.dohod_select option:contains("")').prop('selected',true);
    //$('.dohod_select')
  $('form').attr("data-ajax", "false");
  $('.date').attr("style", "display:none;");
  $('.todate').attr("style", "display:none;");


    $('#radio-choice-h-2a').click(function(){
        $('#div-rashod').hide();
        $('#div-perevod').hide();
        $('#div-dohod').show();
    });

    $('#radio-choice-h-2b').click(function(){
        $('#div-perevod').hide();
        $('#div-dohod').hide();
        $('#div-rashod').show();
    });

    $('#radio-choice-h-2c').click(function(){
        $('#div-rashod').hide();
        $('#div-dohod').hide();
        $('#div-perevod').show();
    });

//    $('#new_dohod').validate({
        //rules: {
            //dohod_rab_id: {
                //required: true
            //}
        //},
        //messages: {
            //dohod_rab_id: {
                //required: "Надо выбрать."
            //}
        //},
        //errorPlacement: function (error, element) {
            //error.appendTo(element.parent().prev());
        //},
        //submitHandler: function (form) {
            //$.mobile.changePage('#success', {
                //transition: "none"
            //});
            //return false;
        //}
    //});

     $("form").validationEngine();

};

$(document).ready(ready);
$(document).on('page:load', ready);

