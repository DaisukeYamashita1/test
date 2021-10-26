class CreateContents < ActiveRecord::Migration[6.1]
  def change
    create_table :contents do |t|
      t.text :title
      t.string :path
      t.integer :category_id

      t.timestamps
    end
  end
end
