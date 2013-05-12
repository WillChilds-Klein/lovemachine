class RemoveListAndCrusherFromCrushes < ActiveRecord::Migration
  def up
    remove_column :crushes, :crush_list
    remove_column :crushes, :crusher
  end

  def down
    add_column :crushes, :crusher, :string
    add_column :crushes, :crush_list, :string
  end
end
