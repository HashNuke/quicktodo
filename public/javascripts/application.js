$(document).ready(function(){

    // Note: for todos#new
    $(".task_name_input").live('keypress', function(e) {
        if(e.which == 13)
        {
            var field = $("#" + $(this).attr('id')).parents('.fields');
            
            // add new field if it's the last
            if(field.nextAll('.fields').length == 0)
                $('.add_task a').click();

            field.next().find('input[type=text]').focus();
            return false;
        }
    });
    
    // Note: for todos#new
    $(".todo .todo_name input[type=text]").live('keypress', function(e) {
        if(e.which == 13)
        {
            if( $(".tasks .task").length > 0)
            {
                $(".tasks .task input[type=text]").first().focus();
            }
            return false;
        }
    });
    
    // Note: for todos#show
    $(".edit_task .task_name").bind('click', function() {
        
        if( $(this).hasClass("striken") )
            $(this).prevAll(".task_completion").val("f");
        else
            $(this).prevAll(".task_completion").val("t");

        $(this).parent('.edit_task').submit();
    });

    // Note: for todos#show
    $('.edit_task').bind('ajax:success', function(evt, data, status, xhr){
        $(this).parent().effect('highlight', {}, 2000);
        
        if( $(this).find('.task_name').hasClass("striken") )
             $(this).find('.task_name').removeClass("striken");
        else
             $(this).find('.task_name').addClass("striken");
         
    }).bind('ajax:error', function(evt, xhr, status, error){
        
    });

    // Note: for todos#show
    $(".notice").animate({ opacity: 0}, 2000);

    $("#error_explanation").effect('highlight', {color: '#FFB3B3'}, 1000);
});
