class AddAuthorToHints < ActiveRecord::Migration
  def change
    add_column :hints, :author, :string
  end
end
