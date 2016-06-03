// Materialize JS for Calendar and Select Form

// JS for select form
$(document).ready(function() {
  $('select').material_select();

  // JS for datepicker
  $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15 // Creates a dropdown of 15 years to control year
  });

});
