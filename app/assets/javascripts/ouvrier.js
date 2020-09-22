//var opt = region.options[region.selectedIndex]; // reference to selected option
//console.log( region.value );
//$(document).ready(function() {
//    $("#ouvrier_region_id").on('change', function(){
//        var region = document.getElementById('ouvrier_region_id'); // Get the element by id
//
//        $ajax({
//        url: "ouvriers/index",
//        type: "GET",
//        data: {region: $(this).val()},
//        // Callbacks that will be explained
//        //success: function(data) {
//        //$("#staff_member_id").children().remove();
//      })
//    })
//})
departement = undefined
function getID() {
    var regionid = document.getElementById("ouvrier_region_id").value
    let regionID = regionid
    if (regionID == "") {
        $("#ouvrier_departement_id").children().remove();
        var departements = $('.departements').data('departements')
        var listdeparetement = [];
        console.log(departements.id)
        
    }else{
        $.ajax({
            url: "ouvriers/filtered",
            type: "GET",
            data: {region_id: regionID},
            success: function(data) {
                $("#ouvrier_departement_id").children().remove();
                var listitems = [];
    
                $.each(data,function(key, value) {
                    listitems += '<option value="' + value.id+ '">' + value.name + '</option>';
                });
                $("#ouvrier_departement_id").append(listitems).prepend("<option value='' selected='selected'></option>");
            }
        });
    }
  }