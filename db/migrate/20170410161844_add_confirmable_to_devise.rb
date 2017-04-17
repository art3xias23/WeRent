class AddConfirmableToDevise < ActiveRecord::Migration[5.0]

	#When the migration is run these three fields will be added to the database
  def up
  	add_column :users, :confirmation_token, :string
  	add_column :users, :confirmed_at, :datetime
  	add_column :users, :confirmation_sent_at, :datetime

  	add_index :users, :confirmation_token, unique: true
  end

#When the DB is rolled back the down method will remove these three columns from the user table
  def down
  	remove_column :users, :confirmation_token, :confirmed_at, :confirmation_sent_at
  end 
end
