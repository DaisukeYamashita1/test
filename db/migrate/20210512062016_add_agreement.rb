class AddAgreement < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :agreement, :string
  end
end
