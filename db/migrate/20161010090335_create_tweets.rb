class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.string :message
      t.timestamps
      t.references :user
    end
  end
end
