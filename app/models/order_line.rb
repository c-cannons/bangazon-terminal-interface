require 'sqlite3'

class OrderLineModel

  # attr_accessor

  def initialize
    @db = SQLite3::Database.open(ENV["BANGAZONTI"])
  end

  def get_all_order_lines
    @all_order_lines = @db.execute("SELECT * FROM Order_details")
  end

  def add_order_line(product_id, order_id)
    @db.execute("INSERT INTO Order_details VALUES (null, '#{product_id}', '#{order_id}');")
    return @db.last_insert_row_id
  end

  def delete_order_line(order_detail_id)
    @db.execute("DELETE FROM Order_details WHERE order_detail_id = #{order_detail_id}")
  end

  def get_order_lines_by_order_id(order_id)
    @order_lines_by_order_id = @db.execute("SELECT * FROM Order_details WHERE order_id = #{order_id}")
    return @order_lines_by_order_id
  end

  def get_order_lines_by_product_id(product_id)
    @order_lines_by_product_id = @db.execute("SELECT * FROM Order_details WHERE product_id = #{product_id}")
    return @order_lines_by_product_id
  end

end

