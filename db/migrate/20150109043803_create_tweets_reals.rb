# Setup Tweets table in db

class CreateTweetsReals < ActiveRecord::Migration
  def change
    create_table :tweets_reals do |t|
      t.string :twt_id
      t.string :username
      t.datetime :twt_created_at
      t.text :twt_text

      t.timestamps null: false
    end
  end
end
