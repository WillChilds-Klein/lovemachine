class RemoveIndCrushesFromCrushes < ActiveRecord::Migration
  def up
    remove_column :crushes, :crush1
    remove_column :crushes, :crush2
    remove_column :crushes, :crush3
    remove_column :crushes, :crush4
    remove_column :crushes, :crush5
    remove_column :crushes, :crush6
    remove_column :crushes, :crush7
  end

  def down
    add_column :crushes, :crush7, :string
    add_column :crushes, :crush6, :string
    add_column :crushes, :crush5, :string
    add_column :crushes, :crush4, :string
    add_column :crushes, :crush3, :string
    add_column :crushes, :crush2, :string
    add_column :crushes, :crush1, :string
  end
end
