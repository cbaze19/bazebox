require 'sinatra'

use Rack::Auth::Basic, "Restricted Area" do |username, password|
  username == '' and password == ''
end

get '/' do
	erb :index
end