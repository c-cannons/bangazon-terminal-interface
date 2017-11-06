require 'sqlite3'

class Customer
  attr_accessor :first_name, :last_name, :street_address, :city, :state, :postal_code, :phone_number

  def initialize
    @db = SQLite3::Database.open("../../bangazon-terminal-interface/bangazon_cli.db") 
  end

  def info(firstname, lastname, street_address, city, state, postal_code, phone_number)
    @first_name = firstname
    @last_name = lastname
    @street_address = street_address
    @city = city
    @state = state
    @postal_code = postal_code
    @phone_number = phone_number
  end

  def save
    @date = Date.today
    begin 
      @db.execute "INSERT INTO Customers VALUES (null,?,?,?,?,?,?,?,'#{@date}',0);", @first_name, @last_name, @street_address, @city, @state, @postal_code, @phone_number
      
      @last_id = @db.last_insert_row_id
      puts "Customer #{@first_name} Saved: #{@first_name}, #{@last_name}, #{@street_address}, #{@city}, #{@state}, #{@postal_code}, #{@phone_number}"
    rescue SQLite3::Exception => e
      p "Exeception with database query: #{e}"
      @db.rollback
    end
  end

  def get_customers
    @customers = @db.execute "SELECT customer_id, customer_first_name, customer_last_name FROM Customers"
    # count = 1
    # @customers.each do |customer|
    #    puts "#{count}. #{customer.join(" ")}"
    #    count += 1
    # end
  end
end