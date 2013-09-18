//= require jquery_ujs
//= require remote_form 
//= require jquery.placeholder

// make console.log safe to use
window.console || (console = {
  log: function() {}
});

jQuery(function($){
  'use strict';
  var THEME = window.THEME || {};

/* ==================================================
	Fix
================================================== */ 

  THEME.fix = function(){
    // fix for ie device_width bug 
    if (navigator.userAgent.match(/IEMobile\/10\.0/)) {
      var msViewportStyle = document.createElement("style");
      msViewportStyle.appendChild(
      document.createTextNode("@-ms-viewport{width:auto!important}"));
      document.getElementsByTagName("head")[0].
      appendChild(msViewportStyle);
    }
  };
  
/* ==================================================
	Placeholder
================================================== */ 

  THEME.placeholder = function(){
    // enable placeholder fix for old browsers
    $('input, textarea').placeholder();
  };

/* ==================================================
	Placeholder
================================================== */ 

  THEME.carousel = function(){
    // start the carousel
    $('.carousel').carousel({
      interval: 3000
    });
  };   
    
/*==================================================
  	Init
==================================================*/

  $(document).ready(function() {
    THEME.fix(); 
    THEME.placeholder();
    THEME.carousel();
  });

}); 
