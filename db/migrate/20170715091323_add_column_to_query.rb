class AddColumnToQuery < ActiveRecord::Migration[5.1]
  def change
    add_column :queries, :destination, :string
    add_column :queries, :description, :string
  end
end
