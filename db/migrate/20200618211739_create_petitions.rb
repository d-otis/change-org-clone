class CreatePetitions < ActiveRecord::Migration[6.0]
  def change
    create_table :petitions do |t|
      t.string :title
      t.text :description
      t.integer :goal

      t.timestamps
    end
  end
end
