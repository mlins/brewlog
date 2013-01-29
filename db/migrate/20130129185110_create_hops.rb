class CreateHops < ActiveRecord::Migration
  def change
    create_table :hops do |t|
      t.string :name
      t.string :origin
      t.decimal :alpha
      t.decimal :beta
      t.string :description
      t.string :form
      t.decimal :hsi
      t.decimal :humulene
      t.decimal :caryophyllene
      t.decimal :cohumulone
      t.integer :myrcene
      t.text :notes

      t.timestamps
    end
  end
end
