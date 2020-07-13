class AddCategoriesToPetitions < ActiveRecord::Migration[6.0]
  def change
  	add_column :petitions, :category_id, :integer
  end
end
