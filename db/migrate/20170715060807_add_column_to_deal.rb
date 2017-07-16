class AddColumnToDeal < ActiveRecord::Migration[5.1]
  def change
    add_column :deals, :company_id, :integer
    add_column :deals, :user_id, :integer
    add_column :deals, :destination, :text
    add_column :deals, :information, :text
  end
end
