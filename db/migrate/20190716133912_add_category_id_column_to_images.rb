class AddCategoryIdColumnToImages < ActiveRecord::Migration[5.2]
  def change
    add_reference :images, :category, foreign_key: true
  end
end
