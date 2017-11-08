# require './app/models/order.rb'
# require './app/models/order_line.rb'

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
    # order_status_array_of_array comes back as an array of one
    order_status_array_of_array = @order.retrieve_active_order(@active_customer[0])
    order_status_array_of_one = order_status_array_of_array.flatten
    # Create new order if there is no active order
    if order_status_array_of_one.length != 0
      @order_status = order_status_array_of_one[0]
      # puts "order status: #{@order_status}"
      return @order_status
    else
      return create_order
    end
  end

  # Creates new order for active customer
  def create_order
    @order_status = @order.new_order(@active_customer[0])
    # puts "order status from create_order: #{@order_status}"
    return @order_status
  end

  # Gets all items in the customer's active order
  def get_order_lines
    current_order = @order_lines.get_order_lines_by_order_id(@order_status)
    return current_order
  end

  # Gets the total cost of all items in the active order, and returns as a float
  def get_grand_total
    # puts "@order_status in get_grand_total: #{@order_status}"
    grand_total_array = @order_lines.get_grand_total_by_order_id(@order_status)
    grand_total_array = grand_total_array.flatten
    # puts "grand_total_array (flattened): #{grand_total_array}"
    grand_total = grand_total_array[1]
    return grand_total
  end

  # Lists payment methods, if any, and returns customer's choice
  def apply_payment_method
      payment_method_array = @payment_method.get_payment_methods_by_customer_id(@active_customer[0])
      # puts "payment_method_array: #{payment_method_array}"
      if payment_method_array.length != 0
          puts "Choose a payment method"
          count = 1
          payment_hash = Hash.new
          payment_method_array.each do |payment|
              puts "#{count}. #{payment[2]} - Account: #{payment[3]}"
              payment_hash[count] = payment
              count += 1
          end
          puts " "
          user_input = gets.chomp
          payment_hash.each do |key, val|
            if user_input.to_s == key.to_s
              puts "Do you want to use #{val[2]}? (y/n)"
              next_user_input = gets.chomp
              if next_user_input.downcase.to_s == "y"
                @order.close_order(val[0],@order_status)
                puts " "
                puts "Success! Payment added and order completed"
                puts " "
                puts "Press any key to return to main menu."
                puts " "
                gets.chomp
              else
                puts "Do you want to use another payment method? (y/n)"
                another_payment_input = gets.chomp
                if another_payment_input.downcase.to_s == "y"
                  apply_payment_method
                else
                  puts " "
                  puts "Payment cancelled. Press any key to return to main menu."
                  puts " "
                  gets.chomp
                end
              end
            end
          end
      else
        # if user has no payment method, it prompts them to add one
        puts " "
        puts "Please add a payment method to customer's account. Press any key to return to main menu."
        puts " "
        gets.chomp
      end
    end


  # Runs to process to close a customer order by adding payment type
  def complete_order
    # checks to see if there's an active order, and creates one if not
    @order_status = check_active_order
    # puts "order status in close_order: #{@order_status}"
    # retrieves grand total for the active order, if any
    the_total = get_grand_total
    # puts "the_total: #{the_total}"

    # checks to see if the total is a number or is nil/zero
    if the_total
      if the_total == 0
        # if the total is 0, it requests that the user add items to the cart
        puts " "
        puts "Please add some items to your shopping cart. Press any key to return to main menu."
        puts " "
        gets.chomp
      else
        # if the total is a number, it asks user if they want to purchase
        puts " "
        puts "Your order total is: $#{the_total}. Ready to purchase? (y/n)"
        confirm_user_input = gets.chomp
        if confirm_user_input.downcase.to_s == "y"
          # if the user wants to check out, it triggers the apply payment method function
          apply_payment_method
        else
      puts " "
      puts "Press any key to return to main menu."
      puts " "
      gets.chomp
        end
      end
    else
      # if the total is nil, it requests that the user add items to the cart
      puts " "
      puts "Please add some items to your shopping cart. Press any key to return to main menu."
      puts " "
      gets.chomp
    end

  end



end

