class CreateImageLoaders < ActiveRecord::Migration[5.2]
  def change
    create_table :image_loaders do |t|
      t.string :site_path

      t.timestamps
    end
  end
end
