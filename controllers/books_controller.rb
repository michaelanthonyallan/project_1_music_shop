require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/book.rb' )
require_relative('../models/publisher.rb')
also_reload( '../models/*' )

get '/books' do
  @books = Book.all()
  erb (:"books/index")
end

get '/books/:id/show' do
  id = (params['id'].to_i)
  @book = Book.find(id)
  erb (:"books/show")
end

post '/books/:id/show/delete' do
  book = Book.find(params["id"])
  book.delete()
  redirect to("/books")
end

get '/books/new' do
  @publishers = Publisher.all()
  erb(:"books/new")
end

post '/books' do
  book = Book.new(params)
  book.save()
  redirect to("/books")
end

get '/books/delete/:id' do
  id = (params['id'].to_i)
  @book = Book.find(id)
  erb (:"books/delete")
end

post '/books/:id/delete' do
  book = Book.find(params["id"])
  book.delete()
  redirect to("/books")
end

get '/books/edit/:id' do
  @book = Book.find(params["id"])
  @publishers = Publisher.all()
  erb(:"books/edit")
end

post "/books/:id" do
  Book.new(params).update()
  redirect to '/books'
end
