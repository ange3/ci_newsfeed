class AddTweetCenter < ActiveRecord::Migration
  def change
    add_column :tweets_reals, :twt_center, :string
  end
end
