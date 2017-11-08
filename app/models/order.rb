require 'sqlite3'

class OrderModel

  def initialize
    @db = SQLite3::Database.open(ENV["BANGAZONTI"])
  end

  # function to retrieve all of a customer's orders, active and inactive, from db
  def retrieve_customer_orders(customer_id)
    @all_customer_orders = @db.execute("SELECT * FROM Orders WHERE customer_id = #{customer_id}")
    return @all_customer_orders
  end

  # function to retrieve order_id of the active customer's active order
  def retrieve_active_order(customer_id)
    @active_order_id = @db.execute("SELECT order_id FROM Orders WHERE pay_method_id IS NULL AND customer_id = #{customer_id}")
    puts "retrieve Active order method return: #{@active_order_id}"
    return @active_order_id
  end

  # function to create a new order
  def new_order(customer_id)
    @db.execute("INSERT INTO Orders VALUES (null, '#{customer_id}', null, '#{Date.today}');")
    return @db.last_insert_row_id
  end

  # function to add a pay method to an order, thereby closing it
  def close_order(pay_method_id, order_id)
    @db.execute("UPDATE Orders SET pay_method_id = #{pay_method_id} WHERE order_id = #{order_id}")
  end

end
