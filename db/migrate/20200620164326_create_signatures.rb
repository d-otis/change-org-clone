class CreateSignatures < ActiveRecord::Migration[6.0]
  def change
    create_table :signatures do |t|
      t.integer :petition_id
      t.integer :user_id
      t.boolean :anonymous

      t.timestamps
    end
  end
end
