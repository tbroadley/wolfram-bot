class ApplicationHandler < Bot::Handler
  use Responders::Introduction
  use Responders::Wolfram
  use Responders::Default

  def user_for(message)
    User.find_or_create_by(username: message["from"])
  end
end
