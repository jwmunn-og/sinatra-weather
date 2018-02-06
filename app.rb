require 'sinatra'

set :port, 3000
get '/' do
  'Hello World!'
end