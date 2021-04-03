class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string     :name               , null: false
      t.text       :text               , null: false
      t.integer    :category_id        , null: false
      t.integer    :status_id          , null: false
      t.integer    :delivery_burden_id , null: false
      t.integer    :start_area_id      , null: false
      t.integer    :delivery_day_id    , null: false
      t.timestamps
    end
  end
end
