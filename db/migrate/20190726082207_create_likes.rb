class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|

      t.timestamps null: false

      t.references :likable, polymorphic: true

    end
  end
end
