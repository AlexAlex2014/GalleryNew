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

  form title: 'Create ImageParser' do |f|
    f.inputs 'ImageLoaders' do
      input :category
      input :image
      input :remote_image_url, input_html: {value: "#{params[:remote_image_url]}"} #, :as => :hidden
      input :body
    end
    actions
  end

  controller do
    def permitted_params
      params.permit image: [:id, :image, :body, :category_id, :remote_image_url ]
    end
  end
end
