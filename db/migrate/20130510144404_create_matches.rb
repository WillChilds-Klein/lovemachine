class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :p1
      t.string :p2

      t.timestamps
    end
  end
end
