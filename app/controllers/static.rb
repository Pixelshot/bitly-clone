require 'byebug'

get '/' do
  # let user create new short ULR, display a list of shortened URLs
  @urls = Url.first(15)
  erb :"static/index"
end

post '/urls' do

	@url = Url.find_by(long_url:params[:long_url])
	 if @url
	 	redirect "/urls/#{@url.id}"
	 else
	 	@url = Url.new(long_url:params[:long_url])
	 	if @url.save
	 		redirect "/urls/#{url.id}"
	 	else
	 		@url = Url.all
	 		@failed = true
	 		@all_url = Url.all.order(click_count: :desc).limit(5)
	 		erb :'static/index'
	 	end
	 end
end

# post '/urls' do
# 	# create a new URL
# 	@current_url = Url.new(long_url: params[:long_url]) 
# 	@current_url.short_url = @current_url.shorty
# 	if @current_url.save
# 		redirect "/"
# 		# url = (Url.all.order(id: :desc)).limit(20)
# 	else
# 		# status = false
# 		# status.to_json
# 		#@urls = Url.all.to_json
# 		redirect to "/"
# 	end
# end

get '/urls/:id' do
  @url = Url.find_by(id: params[:id])
  @all_url = Url.all.order(click_count: :desc).limit(10)
  erb :'static/show'
end

# i.e. /q6bda
get '/:short_url' do
	# redirect to appropriate "long" URL
	url = Url.find_by(short_url: params[:short_url])
	# url.add_count
	redirect to "#{url.long_url}"
end

# get '/' do
# 	puts "[LOG] Getting /"
# 	puts "[LOG] Params: #{params.inspect}"
# 	erb :index
# end


# get '/' do 
#   @urls = Url.all
#   erb :'static/index'
# end

# post '/urls' do 
#  @url = Url.new(long_url: params[:long_url])

#   if @url.save
#     return @url.to_json
#   else
#     @urls = Url.all
#     @failed = true

#     erb :'static/index'
#   end

# end


# get '/urls' do
#   redirect '/'
# end


# get '/all-links' do
#   @links = Url.pluck(:id, :short_url, :long_url)
#   @links.to_json
# end

# get '/:short_url' do 
#   url = Url.find_by(short_url: params[:short_url])
#   url.count
#   redirect "#{url.long_url}"
# end