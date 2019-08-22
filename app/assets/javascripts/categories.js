$(document).ready(function(){
    $(document).on('click', ".delete-link", function() {
        var current_category_tbody = $(this).parents('.post-box')[0];
        if(confirm("#{t(:are_you_sure)}")) {
            $.ajax({
                url: '/categories/' + $(current_category_tbody).attr('data-item_id'),
                type: 'POST',
                data: { _method: 'DELETE' },
                success: function() {
                    $(current_category_tbody).fadeOut(200);
                }
            });
        };
    });


    // $(document).on('"ajax:success"', ".form_ajax[data-remote]", function() {
    //
    //     $.ajax({
    //         url: '/categories/',
    //         type: 'POST',
    //          success: function() {
    //             $('.form_ajax[data-remote]').parent().html("<%= j render '/shared/category_list', categories: @categories %>");
    //         }
    //     });
    // });
    // // $(".form_ajax[data-remote]").html("<%= j (render partial: 'categories/category_body') %>")
    // $('.form_ajax[data-remote]').parent().html("= j render '/shared/category_list', categories: @categories");
});


// $('.form_ajax[data-remote]').html("<%= j render '/shared/category_list', categories: @categories %>");

// $(document).ready ->
//     $("#new_article").on("ajax:success", (event) ->
//         [data, status, xhr] = event.detail
//     $("#new_article").append xhr.responseText
//     ).on "ajax:error", (event) ->
//         $("#new_article").append "<p>ERROR</p>"