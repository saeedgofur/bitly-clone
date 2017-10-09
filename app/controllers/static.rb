

# get '/contact-us' do
# 	erb :"static/contact_us"
# end


###################

get '/' do
  erb :"static/index"
end

######################
get '/about_us' do
	erb :"static/about_us"
end

######################



post '/urls' do
	
	@url = Url.new(long_url: params["long_url"])
	if @url.save
		a = @url.short
		x = Url.find_by(long_url: params["long_url"])
		x.shortened_url = a
		x.save
	else
		@errors = @url.errors.full_messages.join(',')
	end


	redirect '/'

	# params.to_s
	# params stands for parameters and is a hash that contains the input from the user
	
end

######################

# get '/:shortened_url' do
# 	b = request.path_info
# 	a = Url.find_by(shortened_url: b)
# 	x = a.long_url
# 	redirect x
# end
get '/:saeed' do
	a = Url.find_by(shortened_url: params[:saeed])
	if a
		redirect a.long_url
	else
		redirect '/'
	end
end