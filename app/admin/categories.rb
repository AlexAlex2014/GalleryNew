ActiveAdmin.register Category do
  index do
    selectable_column
    id_column
    column "Title of category", :title
    column :text
    column :created_at
    actions
  end

  index as: :grid do |category|
    link_to(image_tag(category.images.first.image.thumb.url, alt: "#{category.title}", title: "#{category.title}") + "#{category.title}", admin_category_path(category)) unless category.images.first.nil?
  end

  controller do
    def permitted_params
      params.permit category: [ :title, :text ]
    end
  end
end
