class CreatePetitionSigners < ActiveRecord::Migration[6.0]
  def change
    create_table :petition_signers do |t|
      t.integer :petition_id
      t.integer :signer_id
      t.boolean :anonymous

      t.timestamps
    end
  end
end
