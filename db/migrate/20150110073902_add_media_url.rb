class AddMediaUrl < ActiveRecord::Migration
  def change
    add_column :tweets_reals, :twt_media_url, :string
  end
end
