class SassEngine < Sinatra::Base
	set :views, File.dirname(__FILE__) + '/public/css'
	get '/css/*.css' do
		filename = params[:splat].first
		scss filename.to_sym
	end
end

use SassEngine

get '/' do
	@icons = Dir.entries("public/batch-icons-1-3/")
	@sortedicons = @icons.sort
	erb :"batch/index", :layout => :'batch/layout'
end