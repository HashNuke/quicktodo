// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){

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

    $(".edit_task .task_name").bind('click', function() {

        if( $(this).hasClass("striken") )
        {
            $(this).removeClass("striken");
            $(this).prevAll(".task_completion").val("f");
        }
        else
        {
            $(this).addClass("striken");
            $(this).prev(".task_completion").val("t");
        }
        var formEle = $(this).parent('.edit_task')
           ,formUrl = formEle.attr('action')
           ,formData = formEle.serialize();

        $.post(formUrl, function(){
          console.log("yes");
        });
    });
    
    $(".notice").animate({ opacity: 0}, 2000);
});
