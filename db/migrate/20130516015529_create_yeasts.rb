class CreateYeasts < ActiveRecord::Migration
  def change
    create_table :yeasts do |t|
      t.string :name
      t.string :laboratory
      t.string :description
      t.string :form
      t.string :product_id
      t.decimal :min_temperature
      t.decimal :max_temperature
      t.decimal :min_attenuation
      t.decimal :max_attenuation
      t.string :flocculation
      t.boolean :master, :default => false
      t.text :notes

      t.references :user

      t.timestamps
    end
  end
end
