class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :name
      t.text :description
      t.integer :total_points
      t.references :skill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
