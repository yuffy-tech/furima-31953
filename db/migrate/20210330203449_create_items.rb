class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :text
      t.integer :category_id        
      t.integer :status_id          
      t.integer :delivery_burden_id 
      t.integer :start_area_id      
      t.integer :delivery_day_id    
      t.integer :price
      t.references :user
    end
  end
end
