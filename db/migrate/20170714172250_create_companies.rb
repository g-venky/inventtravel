class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
    	t.text :about
    	t.text :promotions
    	t.text :reviews

      t.timestamps
    end
  end
end
