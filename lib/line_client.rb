require "line/bot"

class LineClient

  case Rails.env
  when "development"
    LINE_CHANNEL_ID = ENV["LINE_CHANNEL_ID_DEVELOPMENT"]
    LINE_CHANNEL_SECRET = ENV["LINE_CHANNEL_SECRET_DEVELOPMENT"]
  when "production"
    LINE_CHANNEL_ID = ENV["LINE_CHANNEL_ID_PRODUCTION"]
    LINE_CHANNEL_SECRET = ENV["LINE_CHANNEL_SECRET_PRODUCTION"]
  end

  attr_reader :client

  def initialize
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = LINE_CHANNEL_SECRET
      config.channel_token = LINE_CHANNEL_ID
    }
  end

  def push(page)
    client.push_message("U746680ae61a13a1ca1644245c86adba9", create_message(page.url))
  end

  private

  def create_message(url)
    {
      "type" => "text",
      "text" => url + " に更新がありました。"
    }
  end
end
