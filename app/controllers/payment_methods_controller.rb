require_relative '../models/payment_method.rb'

class PaymentMethodsController

    attr_accessor :active_customer
    # sets @payment_method variable as a new instance of PaymentMethod
    def initialize(active_customer)
        @active_customer = active_customer
        @payment_method = PaymentMethod.new
    end

    def get_all_payment_methods
        all_payment_methods = @payment_method.list_all_payment_methods
        count = 1
        all_payment_methods.each do |payment_method|
            puts "#{count}. #{payment_method[0]} - #{payment_method[1]}: #{payment_method[2]}"
            count += 1
        end
        puts ""
        return all_payment_methods
    end

    def add_payment_method
        @active_customer = active_customer[0]
        puts @active_customer
        puts "Name of Payment Method?"
        @payment_type = gets.chomp
        puts "Account Number?"
        @account_number = gets.chomp
        added_method = @payment_method.add_payment_method(@active_customer, @payment_type, @account_number)
        print "Added '#{added_method[0][2]}' Account#: #{added_method[0][3]} for Customer ID: #{added_method[0][1]}"
    end

    def apply_payment_method
      @product_arr = @product.get_products_by_customer(@active_customer[0])
      puts "Choose an item to delete"
      count = 1
      @product_hash = Hash.new
      @product_arr.each do |product|
          puts "#{count}. #{product[2]}"
          @product_hash[count] = product
          count += 1
      end
      puts @product_hash
      puts " "
      user_input = gets.chomp
      @product_hash.each do |key, val|
        if user_input.to_s == key.to_s
          puts "Do you want to delete #{val[2]}? (Y/N)"
          next_user_input = gets.chomp
          if next_user_input.downcase.to_s == "y"
            @product.delete_product(@product_hash[key][0])
          end
        end
      end
    end

end

# pmc = PaymentMethodsController.new(1)
# pmc.add_payment_method
