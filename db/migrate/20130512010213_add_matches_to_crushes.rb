class AddMatchesToCrushes < ActiveRecord::Migration
  def change
    add_column :crushes, :matches, :text
  end
end
