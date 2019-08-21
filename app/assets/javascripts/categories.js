jQuery(function($){
    $(".delete-link").click(function() {
        var current_category_tbody = $(this).parents('tbody')[0];
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
});
