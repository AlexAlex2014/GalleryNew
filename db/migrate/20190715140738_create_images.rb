class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :title
      t.string :image
      t.text :body

      t.timestamps
    end
  end
end
