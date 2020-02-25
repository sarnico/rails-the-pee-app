class AddColumnImageToToilets < ActiveRecord::Migration[5.2]
  def change
    add_column :toilets, :image, :text
  end
end
