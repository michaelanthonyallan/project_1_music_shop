require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/publisher.rb' )
also_reload( '../models/*' )

get '/publishers' do
  @publishers = Publisher.all()
  erb (:"publishers/index")
end

get '/publishers/:id/all-books' do
  id = (params['id'].to_i)
  @publisher = Publisher.find(id)
  @books = @publisher.all_books()
  erb (:"publishers/show_all_books")
end

get '/publishers/new' do
  erb(:"publishers/new")
end

post '/publishers' do
  publisher = Publisher.new(params)
  publisher.save()
  redirect to("/publishers")
end

post '/publishers/:id/delete' do
  publisher = Publisher.find(params["id"])
  publisher.delete()
  redirect to("/publishers")
end

get '/publishers/edit/:id' do
  @publisher = Publisher.find(params["id"])
  erb(:"publishers/edit")
end

post "/publishers/:id" do
  Publisher.new(params).update()
  redirect to '/publishers'
end
