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
