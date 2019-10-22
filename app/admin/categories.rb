# frozen_string_literal: true

ActiveAdmin.register Category do
  index do
    selectable_column
    id_column
    column 'Title of category', :title
    column :text
    column :created_at
    actions
  end

  index as: :grid do |category|
    unless category.images.first.nil?
      link_to(image_tag(category.images.first.image.thumb.url,
                        alt: category.title.to_s,
                        title: category.title.to_s) + category.title.to_s,
              admin_category_path(category))
    end
  end

  controller do
    def permitted_params
      params.permit category: %i[title text]
    end
  end
end
