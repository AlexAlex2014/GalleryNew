class AddUserIdColumnToSubs < ActiveRecord::Migration[5.2]
  def change
    add_reference :subs, :user, foreign_key: true
  end
end
