require 'sinatra'
require 'config_env'
require 'httparty'
require_relative 'models/weather.rb'
require 'uri'

ConfigEnv.init("#{__dir__}/config/env.rb")

set :port, 3000

get '/' do
  @cities = [
    "Seattle",
    "San Francisco",
    "London",
    "Tokyo",
    "Cairo"
  ]

  @city = params[:city] || "San Francisco"
  weather = Weather.new(@city)
  @temp = weather.temp
  @icons = weather.icons
  erb :index
end