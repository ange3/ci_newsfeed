json.array!(@tweets_reals) do |tweets_real|
  json.extract! tweets_real, :id
  json.url tweets_real_url(tweets_real, format: :json)
end
