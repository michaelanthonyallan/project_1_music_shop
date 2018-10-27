require('minitest/autorun')
require('minitest/rg')
require_relative('../book.rb')

class TestBook < MiniTest::Test

  def setup
    @book = Book.new({'title' => 'St. John Passion BWV 245', 'composer' => 'Johann Sebastian Bach', 'description' => 'Vocal Score for the New English Translation by Reverend Lyndon van der Pump', 'stock_quantity' => '2', 'buying_cost' => '5', 'selling_price' => '9.95', 'publisher_id' => 1})
    @book2 = Book.new({'title' => 'St. John Passion BWV 245', 'composer' => 'Johann Sebastian Bach', 'description' => 'Vocal Score for the New English Translation by Reverend Lyndon van der Pump', 'stock_quantity' => '5', 'buying_cost' => '5', 'selling_price' => '9.95', 'publisher_id' => 1})
    @book3 = Book.new({'title' => 'St. John Passion BWV 245', 'composer' => 'Johann Sebastian Bach', 'description' => 'Vocal Score for the New English Translation by Reverend Lyndon van der Pump', 'stock_quantity' => '0', 'buying_cost' => '5', 'selling_price' => '9.95', 'publisher_id' => 1})
  end

def test_stock_indicator__Low_Stock
  # result = @book.stock_indicator
  assert_equal("Low Stock", @book.stock_indicator)
end

def test_stock_indicator__High_Stock
  # result = @book.stock_indicator
  assert_equal("High Stock", @book2.stock_indicator)
end

def test_stock_indicator__Out_of_Stock
  # result = @book.stock_indicator
  assert_equal("Out of Stock", @book3.stock_indicator)
end






















end
