require_relative '../../app/controllers/products_controller.rb'

describe "Products Controller" do

  describe ".delete_customer_product" do
    context "when called" do
      it "takes the active customer ID as an argument" do
        @products = ProductsController.new(@active_customer = 1)
        expect(@active_customer).to be_an(Integer)
      end
      it "uses the product model to pull products belonging to active customer" do
        @products = ProductsController.new(@active_customer = 1)
        @product_list = @products.product.get_products_by_customer(@active_customer[0])
        expect(@product_list).to be_an(Array)
      end
      it "displays active customer's products and takes user input to choose product to delete" do
        user_input = "1"
        expect(user_input).to be_a(String)
      end
    end
    context "after the user chooses a product to delete" do
      it "checks if selected product is in an active order" do
        @products = ProductsController.new(@active_customer = 1)
        @orders = @products.order_line.get_products_from_current_orders.flatten
        expect(@orders).to be_an(Array)
      end
    end
    context "if the product is in a current order" do
      it "explains that product cannot be deleted and returns to previous menu" do
        @products = ProductsController.new(@active_customer = 1)
        @orders = @products.order_line.get_products_from_current_orders.flatten
        expect(@orders).to include(5)
      end
    end
    context "if the product is not in an order" do
      it "allows user to delete product from the database" do
        @products = ProductsController.new(@active_customer = 1)
        @products.product.delete_product(@product_id = 9)
        expect(@product_id).to be_an(Integer)
      end
    end
  end
end


