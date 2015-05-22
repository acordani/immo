$(document).ready(function() {

  // $("#announce_tax_month").hide();


  $("#announce_property_id").change(function() {

    if ( $("#announce_property_id").val() == "8"){

    $("#announce_tax_month").hide();
    }
    else {

     $("#announce_tax_month").show();

    }
  });
});