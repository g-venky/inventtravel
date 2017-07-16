class AddAnotherColumnToQuery < ActiveRecord::Migration[5.1]
  def change
    add_column :queries, :company_id, :integer
  end
end
