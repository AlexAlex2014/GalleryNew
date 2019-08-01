class RemoveColumnTitleFromImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :images, :title, :string
  end
end
