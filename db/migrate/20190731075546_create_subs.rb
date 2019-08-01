class CreateSubs < ActiveRecord::Migration[5.2]
  def change
    create_table :subs do |t|

      t.timestamps null: false

      t.references :subable, polymorphic: true

    end
  end
end
