class CreateCrushes < ActiveRecord::Migration
  def change
    create_table :crushes do |t|
      t.string :crusher
      t.string :crush1
      t.string :crush2
      t.string :crush3
      t.string :crush4
      t.string :crush5
      t.string :crush6
      t.string :crush7

      t.timestamps
    end
  end
end
