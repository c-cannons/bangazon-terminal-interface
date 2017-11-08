require 'sqlite3'

class OrderLineModel

  # attr_accessor

  # sets the database we want to use
  def initialize
    @db = SQLite3::Database.open(ENV["BANGAZONTI"])
  end

  # function to retrieve all individual order lines in the database
  def get_all_order_lines
    @all_order_lines = @db.execute("SELECT * FROM Order_details")
  end

  # function to add a product to an order, using product_id and order_id
  def add_order_line(product_id, order_id)
    @db.execute("INSERT INTO Order_details VALUES (null, '#{product_id}', '#{order_id}');")
    return @db.last_insert_row_id
  end

  # function to delete a particular order line from an order
  def delete_order_line(order_detail_id)
    @db.execute("DELETE FROM Order_details WHERE order_detail_id = #{order_detail_id}")
  end

  # function to retrieve all lines belonging to a particular order number
  def get_order_lines_by_order_id(order_id)
    @order_lines_by_order_id = @db.execute("SELECT * FROM Order_details WHERE order_id = #{order_id}")
    return @order_lines_by_order_id
  end

  # function to retrieve all order lines in the database for a particular product
  def get_order_lines_by_product_id(product_id)
    @order_lines_by_product_id = @db.execute("SELECT * FROM Order_details WHERE product_id = #{product_id}")
    return @order_lines_by_product_id
  end

  # function to get total cost of all items in order by order_id
  def get_grand_total_by_order_id(order_id)
    @grand_total_by_order_id = @db.execute("SELECT Order_details.order_id, SUM(Products.product_price) FROM Order_details LEFT JOIN Products ON Order_details.product_id == Products.product_id WHERE order_id = #{order_id};")
    return @grand_total_by_order_id
  end

end

