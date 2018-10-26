require_relative('../models/publisher')
require_relative('../models/book')
require("pry-byebug")

Publisher.delete_all()
Book.delete_all()

publisher1 = Publisher.new({'name' => 'Edition Peters', 'country' => 'Germany', 'website' => 'https://www.editionpeters.com/'})

publisher1.save()

book1 = Book.new({'title' => 'St. John Passion BWV 245', 'composer' => 'Johann Sebastian Bach', 'description' => 'Vocal Score for the New English Translation by Reverend Lyndon van der Pump', 'stock_quantity' => '1', 'buying_cost' => '5', 'selling_price' => '9.95', 'publisher_id' => publisher1.id})

book1.save()

binding.pry
nil
