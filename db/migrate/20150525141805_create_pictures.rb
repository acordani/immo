class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :announce, index: true

      t.timestamps null: false
    end
    add_foreign_key :pictures, :announces
  end
end
