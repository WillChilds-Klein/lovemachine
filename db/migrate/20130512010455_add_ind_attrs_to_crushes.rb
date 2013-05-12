class AddIndAttrsToCrushes < ActiveRecord::Migration
  def change
    add_column :crushes, :crush1, :string
    add_column :crushes, :crush2, :string
    add_column :crushes, :crush3, :string
    add_column :crushes, :crush4, :string
    add_column :crushes, :crush5, :string
    add_column :crushes, :crush6, :string
    add_column :crushes, :crush7, :string
  end
end
