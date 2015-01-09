class MakeTwtIdUnique < ActiveRecord::Migration
  def change
    add_index :tweets_reals, :twt_id, :unique => true
  end
end
