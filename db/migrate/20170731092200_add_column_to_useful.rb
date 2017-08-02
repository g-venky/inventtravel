class AddColumnToUseful < ActiveRecord::Migration[5.1]
  def change
    add_column :usefuls, :promotion_id, :string
  end
end
