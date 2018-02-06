require 'httparty'

class Weather
  def weather_data
    resp = HTTParty.get(
      "http://api.openweathermap.org/data/2.5/weather?q=London&APPID=#{ENV['API_KEY']}"
    )

    JSON.parse(resp.body)
  end

  def temp
    data = weather_data
    return nil if data.nil? || data['main'].nil? || data['main']['temp'].nil?

    data['main']['temp'] * 9 / 5 - 459.67
  end

end