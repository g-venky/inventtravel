class RemoveColumnFromDeal < ActiveRecord::Migration[5.1]
  def change
    remove_column :deals, :user_id, :integer
  end
end
