$(document).ready(function () {

    $('#hours').focus();

    $('#hours').keyup(function(){
        var hours = $('#hours').val();
        if (hours.length == 2) {
            $('#start_time').val(hours);
            $('#min').focus();
        }
    });

    $('#office_hours').keyup(function(){
        var hours = $('#office_hours').val();
        if (hours.length == 2) {
            $('#office_end_time').val(hours);
            $('#office_min').focus();
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

    $('#office_min').keyup(function(){
        var min = $('#office_min').val();
        if (min.length == 2) {
            var time = $('#office_end_time').val() +':' +min;
            $('#office_end_time').val(time);
            $('#in_office_form').submit();
        }
    });

    $('#activity_activity_type_id').keypress(function(event){

        if (event.keyCode < 49 || event.keyCode > 56) {
            alert('Enter valid activity id');
            return;
        }

        var option_selected = event.keyCode - 48;
        $('#activity_activity_type_id').val(option_selected);
        $('#activity_form').submit();
    });



});