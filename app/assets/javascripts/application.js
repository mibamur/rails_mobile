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

var ready;
ready = function() {

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

};

$(document).ready(ready);
$(document).on('page:load', ready);

