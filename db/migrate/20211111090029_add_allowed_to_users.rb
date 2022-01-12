class AddAllowedToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :allowed, :boolean, default: false, null: false
  end
end
