class CreateFermentables < ActiveRecord::Migration
  def change
    create_table :fermentables do |t|
      t.string :name
      t.string :origin
      t.string :supplier
      t.string :description
      t.decimal :max_in_batch
      t.decimal :potential
      t.decimal :yield
      t.decimal :coarse_fine_difference
      t.decimal :moisture
      t.decimal :diastatic_power
      t.decimal :protein
      t.decimal :ibu
      t.decimal :color
      t.boolean :recommended_mash, :default => false
      t.boolean :add_after_boil, :default => false
      t.text :notes
      t.boolean :master, :default => false

      t.references :user

      t.timestamps
    end
  end
end
