class CreateAds < ActiveRecord::Migration[6.0]
  def change
    create_table :ads do |t|
      t.string :name, null: false, default: ''
      t.text :description, null: false, default: ''
      t.integer :price, null: false, default: 0
      t.references :user

      t.timestamps
    end
  end
end
