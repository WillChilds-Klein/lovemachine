class CreateHints < ActiveRecord::Migration
  def change
    create_table :hints do |t|
      t.string :email
      t.text :content

      t.timestamps
    end
  end
end
