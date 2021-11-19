class AddPasswordDigestToUser2 < ActiveRecord::Migration[6.1]
  def change
    add_column :user2s, :password_digest, :string
  end
end
