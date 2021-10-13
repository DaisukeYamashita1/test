class RenameEmailColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :email, :user_name
  end
end
