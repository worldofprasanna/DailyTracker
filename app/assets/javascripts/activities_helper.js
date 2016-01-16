$(document).ready(function () {

    $('#hours').focus();

    $('#hours').keyup(function(){
        var hours = $('#hours').val();
        if (hours.length == 2) {
            $('#start_time').val(hours);
            $('#min').focus();
        }
    });

    $('#min').keyup(function(){
        var min = $('#min').val();
        if (min.length == 2) {
            var time = $('#start_time').val() +':' +min;
            $('#start_time').val(time);
            $('#activity_activity_type_id').focus();
        }
    });

    $('#activity_activity_type_id').keypress(function(event){

        if (event.keyCode < 49 || event.keyCode > 56) {
            alert('Enter valid activity id');
            return;
        }

        var option_selected = event.keyCode - 48;
        $('#activity_activity_type_id').val(option_selected);
        $('#new_activity').submit();
    });

});