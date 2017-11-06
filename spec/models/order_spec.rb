require_relative "../../app/models/order.rb"

describe OrderModel do

  describe "#retrieve_customer_orders" do
    context "when user chooses active customer" do
      it "retrieves orders belonging to the active customer" do
        order = OrderModel.new
        all_customer_orders = order.retrieve_customer_orders(1)
        p all_customer_orders
          expect(all_customer_orders).to be_an(Array)
          expect(all_customer_orders[0][1]).to eql(1)
      end
    end
  end


  describe "#new_order" do
    context "when new_order function triggered" do
      it "adds a new order, with inputs active customer and date" do
        order = OrderModel.new
        the_new_order_id = order.new_order(3)

          # expect(the_new_order).to be_an(Integer)
          # expect(@customer_id).to be_an(Integer)
          # expect(@pay_method_id).to eql(nil)
          # expect(@order_date).to eql(Date.today)
      end
    end
  end


  # describe ""




end
