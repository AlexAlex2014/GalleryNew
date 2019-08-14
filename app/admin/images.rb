ActiveAdmin.register Image do
  index do
    selectable_column
    id_column
    column :image do |image|
      link_to(image_tag(image.image.small_thumb.url, alt: "qqq", title: "qqqq"), admin_image_path(image)) unless image[:image].nil?
    end
    column :body
    column :created_at
    column :category
    actions
  end
  controller do
    def permitted_params
      params.permit image: [ :image, :body, :category ]
    end
  end


end
