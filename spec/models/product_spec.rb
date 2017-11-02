require "/Users/Admin/Desktop/bangazon-terminal-interface/app/models/product.rb"

describe ProductModel do

    context "when calling all products" do
        it "should return an array of products from the database" do
            product = ProductModel.new
            all_products = product.get_products

            expect(all_products).to be_an(Array)
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