ActiveAdmin.register Comment, :as => "UserComment" do
  index do
    selectable_column
    id_column
    column :commenter
    column :body
    column :image_id do |comment|
      link_to image_tag(comment.image.image.small_thumb.url, alt: "qqq", title: "qqqq"), admin_user_comment_path(comment)
    end
    column :created_at
    actions
  end

  controller do
    def permitted_params
      params.permit comment: [ :commenter, :body, :image_id ]
    end
  end
end
