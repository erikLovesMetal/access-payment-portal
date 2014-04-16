class CreateParses < ActiveRecord::Migration
  def change
    create_table :parses do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :user_id
      t.string :address

      t.timestamps
    end
  end
end
