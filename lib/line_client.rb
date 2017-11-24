require "line/bot"

class LineClient

  case Rails.env
  when "development"
    LINE_CHANNEL_SECRET = ENV["LINE_CHANNEL_SECRET_DEVELOPMENT"]
  when "production"
    LINE_CHANNEL_SECRET = ENV["LINE_CHANNEL_SECRET_PRODUCTION"]
  end

  attr_reader :client

  def initialize
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = LINE_CHANNEL_SECRET
      config.channel_token = ENV["LINE_ACCESS_TOKEN"]
    }
  end

  def push(page)
    client.push_message(ENV["DEVELOPERS_LINE_ID"], create_message(page.url))
  end

  private

  def create_message(url)
    {
      "type" => "text",
      "text" => url + " に更新がありました。"
    }
  end
end
