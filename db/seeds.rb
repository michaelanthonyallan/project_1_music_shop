require_relative('../models/publisher')
require("pry-byebug")

Publisher.delete_all()

publisher1 = Publisher.new({'name' => 'Edition Peters', 'country' => 'Germany', 'website' => 'https://www.editionpeters.com/'})

publisher1.save()

binding.pry
nil
