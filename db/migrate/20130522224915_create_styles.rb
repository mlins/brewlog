class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.string :name
      t.string :category
      t.string :category_number
      t.string :style_letter
      t.string :style_guide
      t.string :description
      t.decimal :og_min
      t.decimal :og_max
      t.decimal :fg_min
      t.decimal :fg_max
      t.decimal :ibu_min
      t.decimal :ibu_max
      t.decimal :color_min
      t.decimal :color_max
      t.decimal :carb_min
      t.decimal :carb_max
      t.decimal :abv_min
      t.decimal :abv_max
      t.text :notes
      t.text :profile
      t.text :ingredients
      t.text :examples
      t.boolean :master

      t.references :user

      t.timestamps
    end
  end
end
