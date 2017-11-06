require_relative "../../app/models/product.rb"

describe ProductModel do

    context "when calling all products" do
        it "should return an array of products from the database" do
            product = ProductModel.new
            all_products = product.get_products
            expect(all_products).to be_an(Array)
        end
    end

    context "When calling add product test for the following:" do
        it "Checking the array of products and make sure 'Shoes' is not included in the table" do
            product = ProductModel.new
            product_arr = product.get_products
            expect(product_arr.flatten).not_to include("Shoes")
        end
        it "Now it should add a product with the product_name 'Shoes' and other product info and test each argument against its preferred class" do
            product = ProductModel.new
            new_product = product.add_product(@product_name = "Shoes", @product_price = 9.99, @product_desc = "Nice shoes")
            expect(@product_name).to be_an(String)
            expect(@product_name).to eq "Shoes"
            expect(@product_price).to be_a(Float)
            expect(@product_desc).to be_a(String)
            expect(new_product).to be_a(Integer)
        end
        it "Now that it has created a new product 'Shoes', check the database again to make sure it has added the 'Shoes' product." do
            product = ProductModel.new
            new_product_arr = product.get_products
            expect(new_product_arr.flatten).to include("Shoes")
        end
    end

end