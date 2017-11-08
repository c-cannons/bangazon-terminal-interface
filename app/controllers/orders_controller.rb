require_relative "../models/order.rb"
require_relative "../models/order_line.rb"

class OrdersController
  attr_accessor :order_status

  def initialize(active_customer)
  # @active_customer is an array [customer_id, first_name, last_name]
  @active_customer = active_customer
  @order = OrderModel.new
  @order_lines = OrderLineModel.new
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

  def get_order_lines(order_id)
    current_order = @order_lines.get_order_lines_by_order_id(order_id)
    return current_order
  end

  def get_grand_total(order_id)
    puts "order id in get_grand_total: #{order_id}"
    grand_total = @order_lines.get_grand_total_by_order_id(order_id)
    return grand_total
  end

  def close_order
    @order_status = @order.retrieve_active_order(@active_customer[0])
    @order_status = @order_status.flatten[0]
    puts "order status in close_order: #{@order_status}"

    if @order_status
      # now evaluate the number
      puts "@order_status was not nil"
      puts "order status in close_order IF STMT: #{@order_status}"

    else
      puts "@order_status was nil"
      puts "order status in close_order IF STMT: #{@order_status}"
    end


    # elsif @order
    #   puts "order status in close_order IF STMT: #{@order_status}"
    #   order_id_and_order_total = get_grand_total(@order_status)
    #   order_id_and_order_total = order_id_and_order_total.flatten
    #   puts "results from get order lines #{order_id_and_order_total}"


    #   if order_id_and_order_total[1] = nil
    #   #if there are no items in the active order, it asks user to add items
    #   puts "Please add some products to your order first. Press any key to return to main menu."
    #   # elsif order_id_and_order_total[1] > 0
    #   #   # this condition executes if there are items in the active order
    #   #   puts "checkout goes here"
    #   else
    #     puts "huh?"
    #   end

    #   # return @order_status
    # else
    #   puts "There is no active order!"
    # end



  end



end

