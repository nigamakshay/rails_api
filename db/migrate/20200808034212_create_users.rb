class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age, :limit => 1
      t.string :email
      t.string :password_digest
      t.integer :rating, :limit => 1
      t.timestamps
    end
  end
end
