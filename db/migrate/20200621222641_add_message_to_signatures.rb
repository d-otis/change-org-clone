class AddMessageToSignatures < ActiveRecord::Migration[6.0]
  def change
  	add_column :signatures, :message, :text
  end
end
