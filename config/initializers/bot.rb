Bot.configure do |config|
  config.adapter = Bot::Adapter::Kik.new(bot_user: ENV['KIK_BOT_USER'], bot_token: ENV['KIK_TOKEN'])
  config.redis = Redis.new
end
