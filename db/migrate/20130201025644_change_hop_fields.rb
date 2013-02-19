class ChangeHopFields < ActiveRecord::Migration
  def up
    drop_table :hops
    create_table :hops do |t|
      t.string :name
      t.string :origin
      t.decimal :alpha
      t.decimal :beta
      t.string :description
      t.string :form
      t.decimal :hsi
      t.decimal :humulone
      t.decimal :cohumulone
      t.decimal :adhumulone
      t.decimal :lupulone
      t.decimal :colupulone
      t.decimal :adlupulone
      t.decimal :humulene
      t.decimal :myrcene
      t.decimal :caryophyllene
      t.decimal :farnese
      t.text :notes

      t.references :user

      t.boolean :master, :default => false

      t.timestamps
    end
  end

  def down
    drop_table :hops
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
