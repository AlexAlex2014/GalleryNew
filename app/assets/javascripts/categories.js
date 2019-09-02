$(document).ready(function(){
    $(document).on('click', ".delete-link", function() {
        var current_category_tbody = $(this).parents('.post-box')[0];
        if(confirm("Are you sure?")) {
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

