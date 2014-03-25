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
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require jquery.anythingslider.min
//= require jQueryRotateCompressed.2.2
//= require jquery.arctext
//= require lightbox
//= require selectnav.min
//= require jquery.nivo.slider.pack
//= require bootstrap.min

$( document ).ready(function() {
  // Makes the primary button modal submit the forms that it contains
  $("#myModal").on('show', function (e) {
    $(".ok-modal-button").click( function (element) {
      form = $("#myModal").find("form")
      if (form.length > 0) {
        form.submit();
      }
      else {
        Turbolinks.visit("/purchases/new");
      }
    });
  })
  //Cleans the modal when it hiddes
  $("#myModal").on('hidden.bs.modal', function (e) {
  	$(this).removeData();
  })

  $

});