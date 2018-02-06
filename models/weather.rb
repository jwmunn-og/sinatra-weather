require 'httparty'
require 'uri'

class Weather
  def initialize(city)
    @city = city
  end

  def weather_data
    resp = HTTParty.get(
      "http://api.openweathermap.org/data/2.5/weather?q=#{URI.escape(@city)}&APPID=#{ENV['API_KEY']}"
    )

    JSON.parse(resp.body)
  end

  def temp
    data = weather_data
    return nil if data.nil? || data['main'].nil? || data['main']['temp'].nil?

    data['main']['temp'] * 9 / 5 - 459.67
  end

  def icons
    data = weather_data
    return [] if data.nil? || data['weather'].nil?
    data['weather'].collect do |weather|
      weather['icon'] + ".png"
    end.uniq
  end

end