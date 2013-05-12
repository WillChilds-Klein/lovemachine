class AddUuidToCrushes < ActiveRecord::Migration
  def change
    add_column :crushes, :uuid, :string
  end
end
