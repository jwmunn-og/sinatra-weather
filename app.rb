require 'sinatra'
require 'config_env'
require 'httparty'
require_relative 'models/weather.rb'
ConfigEnv.init("#{__dir__}/config/env.rb")

set :port, 3000

get '/' do
  weather = Weather.new
  @temp = weather.temp
  erb :index
end