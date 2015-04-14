require 'sinatra'

use Rack::Auth::Basic, "Restricted Area" do |username, password|
  username == 'baze' and password == 'yukon1992'
end

get '/' do
	erb :index
end