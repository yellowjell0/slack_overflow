class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.string :vote_type
      t.references :user, foreign_key: true
      t.integer :voteables_id
      t.string :voteables_type

      t.timestamps
    end
  end
end
