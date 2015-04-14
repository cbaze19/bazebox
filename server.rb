# Main Server File
# Responsible for main routing of app

require 'sinatra'

# Sets server to run in production mode
# Do this to be able to access app via external IP
# set :environment, :production

use Rack::Auth::Basic, "Restricted Area" do |username, password|
  username == '' and password == ''
end

get '/' do
	erb :index
end