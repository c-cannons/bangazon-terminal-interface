require "/Users/Admin/Desktop/bangazon-terminal-interface/app/models/product.rb"

describe ProductModel do

    context "when calling all products" do
        it "should return an array of products from the database" do
            product = ProductModel.new
            all_products = product.get_products
            expect(all_products).to be_an(Array)
        end
    end

    context "when calling add product" do
        it "should ask for the name, price and description of the product" do
            product = ProductModel.new
            new_product = product.add_product(@product_name = "Shoes", @product_price = 9.99, @product_desc = "Nice shoes")
            expect(@product_name).to be_an(String)
            expect(@product_name).to eq "Shoes"
            expect(@product_price).to be_a(Float)
            expect(@product_desc).to be_a(String)
            expect(new_product).to be_a(Integer)
        end
    end

    context "when calling all customers" do
        it "should return an array of customers from the database" do
            customer = ProductModel.new
            all_customers = customer.get_customers
            expect(all_customers).to be_an(Array)
        end
    end

    

end