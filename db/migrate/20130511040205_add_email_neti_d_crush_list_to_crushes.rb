class AddEmailNetiDCrushListToCrushes < ActiveRecord::Migration
  def change
    add_column :crushes, :email, :string
    add_column :crushes, :NetID, :string
    add_column :crushes, :crush_list, :string
  end
end
