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
//= require jquery.validate
//= require messages_ru

//= require timeBox
//= require mobile_datebox_i18n_ru

// require highcharts/highcharts                                                           
// require highcharts/highcharts-more                                                         
// require highcharts/highstock
// require highcharts/modules/exporting
// require highcharts-data
//= require cocoon

  // $.mobile.ajaxLinksEnabled = false;
  // $('form').attr("data-ajax", "false");


    // $.widget( "mobile.flipswitch", $.extend({
    //     options: {
    //         onText: "Да",
    //         offText: "Нет",
    //     }
    // });

var ready;
ready = function() {
    //$('select.dohod_select option[value="1"]').attr("selected",true);
    //$('select.rashod_select option[value="1"]').attr("selected",true);
    //$('.dohod_select option:contains("")').prop('selected',true);
    //$('.dohod_select')

    $(".ui-flipswitch-off").text("Нет");
    $(".ui-flipswitch-on").text("Да");
    $( ".check1" ).flipswitch({ offText: "Нет", onText: "Да" });


    $( ".ui-flipswitch" ).each( function () {
        if ($(this).hasClass('ui-flipswitch-active')) {
            $(this).parent().parent().parent().parent().find(".tttime").hide();
        } else {
            $(this).parent().parent().parent().parent().find(".tttime").show();
        };
    });


    $( ".ui-flipswitch" ).on( "change", function () {
        if ($(this).hasClass('ui-flipswitch-active')) {
            $(this).parent().parent().parent().parent().find(".tttime").first().fadeOut();
            $(this).parent().parent().parent().parent().find(".tttime").next().first().fadeOut();

        } else {

            $(this).parent().parent().parent().parent().find(".tttime").first().fadeIn();
            $(this).parent().parent().parent().parent().find(".tttime").next().first().fadeIn();
        };
    });





  // $.mobile.ajaxLinksEnabled = false;
  $('form').attr("data-ajax", "false");

  // $('.date').attr("style", "display:none;");
  // $('.todate').attr("style", "display:none;");


    $('#radio-choice-h-2a').click(function(){
        $('#div-rashod').fadeOut("fast");//.hide("slidedown");
        $('#div-perevod').fadeOut("fast");
        // $('#div-dohod').show();
        $('#div-dohod').show("slideup");
        //slideup
    });

    $('#radio-choice-h-2b').click(function(){
        $('#div-perevod').fadeOut("fast");
        $('#div-dohod').fadeOut("fast");
//        $('#div-rashod').fadeIn('slow');
        $('#div-rashod').show("slideup");
    });

    $('#radio-choice-h-2c').click(function(){
        $('#div-rashod').fadeOut("fast");
        $('#div-dohod').fadeOut("fast");
        $('#div-perevod').show("slideup");
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

     //$("form").validationEngine();
    // $( "form" ).validate();
    //{
            //submitHandler: function( form ) {
            //alert( "Call Login Action" );
        //}
    //});


$( "body" ).on( "pageinit", function() {

    // $( "form" ).validate();

    $(".formDRP").validate({
       onsubmit: false
    });

    // Validate the form and submit programmatically:

    if( $(".formDRP").valid() ){
      // post validation code
      // form.submit()
      
    }

    // $( "form" ).validate({
    //     rules: {
    //         email: {
    //             required: true
    //         },
    //         password: {
    //             required: true
    //         }
    //     },
    //     errorPlacement: function( error, element ) {
    //         error.insertAfter( element.parent() );
    //     }
    // });


    // $( "input:checkbox" ).flipswitch({ offText: "Нет", onText: "Да" });

    $(".ui-flipswitch-off").text("Нет");
    $(".ui-flipswitch-on").text("Да");
    $( ".check1" ).flipswitch({ offText: "Нет", onText: "Да" });



});


};

$(document).ready(ready);
$(document).on('page:load', ready);

$(document).on( "mobileinit", function() {
  // $.mobile.selectmenu.prototype.options.nativeMenu = false;
  $.mobile.ajaxLinksEnabled = false;
});

