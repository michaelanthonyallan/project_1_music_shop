require_relative("../db/sql_runner")
require('pry')

class Book

  attr_accessor :id, :title, :composer, :description, :stock_quantity, :buying_cost, :selling_price, :publisher_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @composer = options['composer']
    @description = options['description']
    @stock_quantity = options['stock_quantity'].to_i
    @buying_cost = options['buying_cost']
    @selling_price = options['selling_price']
    @publisher_id = options['publisher_id']
  end

  def save()
    sql = "INSERT INTO books (title, composer, description, stock_quantity, buying_cost, selling_price, publisher_id)
    VALUES ($1, $2, $3, $4, $5, $6, $7)
    RETURNING ID"
    values = [@title, @composer, @description, @stock_quantity, @buying_cost, @selling_price, @publisher_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM books"
    results = SqlRunner.run(sql)
    return results.map{ |book| Book.new(book)}
  end

  def self.find(id)
    sql = "SELECT * FROM books WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Book.new(results.first)
  end

  def update()
    sql = "UPDATE books SET (title, composer, description, stock_quantity, buying_cost, selling_price, publisher_id) = ($1, $2, $3, $4, $5, $6, $7)
    WHERE id = $8"
    values = [@title, @composer, @description, @stock_quantity, @buying_cost, @selling_price, @publisher_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM books"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM books WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def publisher_name
    sql = "SELECT * FROM publishers WHERE id = $1"
    values = [@publisher_id]
    publisher = SqlRunner.run(sql, values).first
    result = Publisher.new(publisher)
    name = result.name
    return name
  end

  def stock_indicator
    # if @stock_quantity >= 3
    #   return "High Stock"
    if @stock_quantity.between?(1,3)
      return "Low Stock"
    elsif @stock_quantity < 1
      return "Out of Stock"
    end
  end

end
