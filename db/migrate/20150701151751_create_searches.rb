class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :sproperty
      t.string :slocality
      t.integer :ssurface

      t.timestamps null: false
    end
  end
end
