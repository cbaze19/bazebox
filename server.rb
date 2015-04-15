# Main Server File
# Responsible for main routing of app

require 'sinatra'
require 'filesize'

# Sets server to run in production mode
# Do this to be able to access app via external IP

set :environment, :production

use Rack::Auth::Basic, "Restricted Area" do |username, password|
  username == 'baze' and password == 'yukon1992'
end

get '/' do

	fnames = Dir.glob("./public/files/*.*").map{|f| f.split('/').last}
	fsizes = Array.new
	Dir.glob("./public/files/*.*") do |item|
		fsize = Filesize.from("#{File.size(item)} B").pretty
		fsizes.push fsize
	end

	erb :index, :locals => {:filenames => fnames, :filesizes => fsizes}
end

post '/upload' do
	
	filename = params[:file][:filename]
	file = params[:file][:tempfile]

	File.open("./public/files/#{filename}", 'wb') do |f|
		f.write(file.read);
	end

	redirect '/'

end

get '/download/:filename' do |filename|

	send_file "./public/files/#{filename}", :filename => filename, :type => 'Application/octet-stream'

	redirect '/'

end

get '/delete/:filename' do |filename|

	File.delete("./public/files/#{filename}")

	redirect '/'

end