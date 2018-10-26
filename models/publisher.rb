require_relative( '../db/sql_runner' )

class Publisher

  attr_accessor :id, :name, :country, :website

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @country = options['country']
    @website = options['website']
  end

  def save()
    sql = "INSERT INTO publishers (name, country, website)
    VALUES ($1, $2, $3)
    RETURNING ID"
    values = [@name, @country, @website]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM publishers"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM publishers"
    results = SqlRunner.run(sql)
    return results.map{ |publisher| Publisher.new(publisher)}
  end

  def update()
    sql = "UPDATE publishers SET (name, country, website) = ($1, $2, $3)
    WHERE id = $4"
    values = [@name, @country, @website, @id]
    SqlRunner.run(sql, values)
  end









end
