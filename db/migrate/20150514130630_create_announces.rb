class CreateAnnounces < ActiveRecord::Migration
  def change
    create_table :announces do |t|
      t.string :title
      t.string :type_property
      t.integer :bed
      t.integer :bath
      t.integer :surface
      t.string :features
      t.integer :construction
      t.string :ges
      t.string :class_energy
      t.text :description
      t.integer :tax_month
      t.references :user, index: true
      t.integer :price

      t.timestamps null: false
    end
    add_foreign_key :announces, :users
  end
end
