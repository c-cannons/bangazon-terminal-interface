# require './app/models/order.rb'
# require './app/models/order_line.rb'

class OrdersController
  attr_accessor :order_status

  def initialize(active_customer)
  # @active_customer is an array [customer_id, first_name, last_name]
  @active_customer = active_customer
  @order = OrderModel.new
  @payment_method = PaymentMethod.new
  end

  def check_active_order
    @order_status = @order.retrieve_active_order(@active_customer[0])
    if @order_status == Integer
      puts "order status: #{@order_status}"
      return @order_status
    else
      return create_order
    end
  end

  def create_order
    @order_status = @order.new_order(@active_customer[0])
    puts "order status from create_order: #{@order_status}"
    return @order_status
  end

end
