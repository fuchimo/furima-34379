class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :item_name,       null: false
      t.text       :item_explain,    null: false
      t.integer    :item_price,      null: false
      t.integer    :category_id,     null: false
      t.integer    :condition_id,    null: false
      t.integer    :charge_id,       null: false
      t.integer    :prefecture_id,   null: false
      t.integer    :sending_days_id, null: false
      t.references :user,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
