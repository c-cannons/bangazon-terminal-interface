require 'sqlite3'

class ProductModel
    # Sets the current database that we want to interact with
    def initialize
        @db = SQLite3::Database.open("/Users/Admin/Desktop/bangazon-terminal-interface/bangazon_cli.db")
    end

    # Pulls product details for all items in the Products table
    def get_products
        @db.execute("SELECT product_name, product_price, product_desc FROM Products;")
    end

    # Takes input from the user, assigns the input to local variables and inserts it into the Products table
    def add_product
        puts "Name of product?"
        product_name = gets.chomp
        puts "Price of Product?"
        product_price = gets.chomp
        puts "Product description?"
        product_desc = gets.chomp
        @db.execute(
            "INSERT INTO Products VALUES (null, 5, '#{product_name}', '#{product_price}', '#{product_desc}', '#{Date.today}');"
        )
    end
    
    # Pulls customer details for all items in the Customers table
    def get_customers
        @db.execute("SELECT customer_id, customer_first_name, customer_last_name FROM Customers")
    end
end

# product_list = ProductModel.new
# product_list.get_products
# product_list.get_customers
# product_list.add_product
