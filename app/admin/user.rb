# frozen_string_literal: true

ActiveAdmin.register User do
  index do
    selectable_column
    id_column
    column 'Email', :email
    column 'Firt name', :first_name
    column 'Last name', :last_name
    column 'Sign_in_count', :sign_in_count
    column :created_at
    actions
  end

  controller do
    def permitted_params
      params.permit user: %i[email first_name last_name]
    end
  end
end
