class AddChapterIdToContents < ActiveRecord::Migration[6.1]
  def change
    add_column :contents, :chapter_id, :integer
  end
end
