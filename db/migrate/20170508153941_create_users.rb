class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.text :description, :default  => "This user was too lazy to enter a description."
      t.string :user_name
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
