$(document).ready(function() {
    $.ajax({
        url: '/free/details',
        type: 'GET',
        dataType: 'json',
        success: function(response) {
            if(response.returnCode === "200") {
                var details = response.data;
            }
        }
    })
})