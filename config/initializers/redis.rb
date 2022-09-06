# if ENV["REDISCLOUD_URL"]
#     $redis = Redis.new(:url => ENV["REDISCLOUD_URL"])
# end

if Rails.env.production?
  uri = URI.parse(ENV["REDISCLOUD_URL"])
  $redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
end
