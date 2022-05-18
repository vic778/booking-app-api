class CreateMotorcycles < ActiveRecord::Migration[7.0]
  def change
    create_table :motorcycles do |t|
      t.string :title
      t.text :description
      t.string :image
      t.integer :year
      t.string :model
      t.boolean :available, default: true
      t.string :color
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
