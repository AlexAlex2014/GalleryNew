class CreateActions < ActiveRecord::Migration[5.2]
  def change
    create_table :actions do |t|
      t.string :action
      t.string :action_path

      t.timestamps
    end
  end
end
