require_relative('../models/publisher')
require_relative('../models/book')
require("pry-byebug")

Publisher.delete_all()
Book.delete_all()

publisher1 = Publisher.new({'name' => 'Edition Peters', 'country' => 'Germany', 'website' => 'https://www.editionpeters.com/'})

publisher1.save()

book1 = Book.new({'title' => 'St. John Passion BWV 245', 'composer' => 'Johann Sebastian Bach', 'description' => 'Vocal Score for the New English Translation by Reverend Lyndon van der Pump', 'stock_quantity' => '1', 'buying_cost' => '5', 'selling_price' => '9.95', 'publisher_id' => publisher1.id})
book2 = Book.new({'title' => '12 Minuets from Seven times Seven and One Vol. 2', 'composer' => 'Georg Philipp Telemann', 'description' => 'Nos. 8, 17, 30, 33, 36, 43 for Violin (Flute, Oboe), Viola (Clarinet) and Violoncello (Bassoon)', 'stock_quantity' => '1', 'buying_cost' => '10', 'selling_price' => '15.95', 'publisher_id' => publisher1.id})
book3 = Book.new({'title' => '12 Vocal Quartets', 'composer' => 'Johannes Brahms', 'description' => 'Opp. 31, 64, 92 and 112', 'stock_quantity' => '1', 'buying_cost' => '10', 'selling_price' => '16.95', 'publisher_id' => publisher1.id})

book1.save()
book2.save()
book3.save()

binding.pry
nil
