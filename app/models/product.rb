require 'sqlite3'

class ProductModel
    # Sets the current database that we want to interact with
    def initialize
        @db = SQLite3::Database.open(ENV["BANGAZONTI"])
    end

    # Pulls product details for all items in the Products table
    def get_products
        @db.execute("SELECT product_name, product_price, product_desc FROM Products;")
    end

    # Takes input from the user, assigns the input to local variables and inserts it into the Products table
    def add_product(product_name, product_price, product_desc)
        @db.execute("INSERT INTO Products VALUES (null, 5, '#{product_name}', '#{product_price}', '#{product_desc}', '#{Date.today}');")
        @db.last_insert_row_id
    end

    # # Pulls customer details for all items in the Customers table
    # def get_customers
    #     @db.execute("SELECT customer_id, customer_first_name, customer_last_name FROM Customers")
    # end
end

# new_product = ProductModel.new
# new_product.add_product("Jordans", "399.48", "Air Jordans")

# product_list = ProductModel.new
# product_list.get_products
# product_list.get_customers
# product_list.add_product
