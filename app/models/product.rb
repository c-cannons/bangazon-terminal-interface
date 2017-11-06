require 'sqlite3'

class ProductModel
    # Sets the current database that we want to interact with
    def initialize
        @db = SQLite3::Database.open(ENV["BANGAZONTI"])
    end

    # Pulls product details for all items in the Products table
    def get_products
        products_arr = @db.execute("SELECT product_name, product_price, product_desc FROM Products;")
        @db.close
        return products_arr
    end

    # Takes input from the user, assigns the input to local variables and inserts it into the Products table
    def add_product(product_name, product_price, product_desc)
        @db.execute("INSERT INTO Products VALUES (null, 5, '#{product_name}', '#{product_price}', '#{product_desc}', '#{Date.today}');")
        new_id = @db.last_insert_row_id
        added_product = @db.execute "SELECT * FROM Products WHERE product_id = #{new_id};"
        @db.close
        return added_product
    end

    def delete_product(id)
        @db.execute "DELETE FROM Products WHERE product_id = #{id};"
        @db.close
    end
end

# new_product = ProductModel.new
# new_product.add_product("Jordans", "399.48", "Air Jordans")

# product_list = ProductModel.new
# product_list.get_products
# product_list.get_customers
# product_list.add_product
