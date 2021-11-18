class AddIndexToUsers2Email < ActiveRecord::Migration[6.1]
  def change
    add_index :user2s, :email, unique: true
  end
end
