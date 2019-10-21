# frozen_string_literal: true

ActiveAdmin.register Action do
  index do
    selectable_column
    id_column
    column 'Users', :user_id
    column 'Actions', :action
    column 'URL', :action_path
    column :created_at

    actions
  end

  controller do
    def permitted_params
      params.permit action: %i[user_id action]
    end
  end
end
