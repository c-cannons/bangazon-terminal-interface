require 'sqlite3'

class OrderModel

  attr_accessor :the_new_order

  def initialize
    @db = SQLite3::Database.open(ENV["BANGAZONTI"])
  end

  def retrieve_customer_orders(customer_id)
    @all_customer_orders = @db.execute("SELECT * FROM Orders WHERE customer_id = #{customer_id}")
  end

  def new_order(customer_id)
    @db.execute("INSERT INTO Orders VALUES (null, '#{customer_id}', null, '#{Date.today}');")
    return @db.last_insert_row_id
  end





end
