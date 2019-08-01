class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :location
      t.string :gender
      t.date :birthday

      t.timestamps
    end
  end
end
