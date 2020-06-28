class AddOauthToUsers < ActiveRecord::Migration[6.0]
  def change
  	add_column :users, :created_with_oauth, :boolean, :default => false
  end
end
