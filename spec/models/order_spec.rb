require_relative "../../app/models/order.rb"

describe OrderModel do

  describe "#retrieve_customer_orders" do
    context "when user chooses active customer" do
      it "retrieves all orders belonging to the active customer" do
        order = OrderModel.new
        all_customer_orders = order.retrieve_customer_orders(1)
        p all_customer_orders
          expect(all_customer_orders).to be_an(Array)
          expect(all_customer_orders[0][1]).to eql(1)
      end
    end
  end


  describe "#retrieve_active_order" do
    context "when user chooses active customer" do
      it "retrieves the customer's active order" do
        order = OrderModel.new
        active_customer_order = order.retrieve_active_order(2)
        p active_customer_order
          expect(active_customer_order).to be_an(Array)
          expect(active_customer_order[0][2]).to eql(nil)
      end
    end
  end


  describe "#new_order" do
    context "when new_order function triggered" do
      it "adds a new order, with inputs active customer and date" do
        order = OrderModel.new
        the_new_order_id = order.new_order(3)
        p the_new_order_id
        @db = SQLite3::Database.open(ENV["BANGAZONTI"])
        check_for_new_order = @db.execute("SELECT * FROM Orders WHERE order_id = #{the_new_order_id}")
        p check_for_new_order
          expect(the_new_order_id).to be_an(Integer)
          expect(check_for_new_order.flatten[1]).to be_an(Integer) #checks customer_id
          expect(check_for_new_order.flatten[2]).to eql(nil) #checks pay_method_id
          expect(check_for_new_order.flatten[3]).to eql(Date.today.to_s) #checks order_date
      end
    end
  end


  describe "#close_order" do
    context "when close_order function triggered" do
      it "adds payment id to the current order" do
        order = OrderModel.new
        order.close_order(4, 3)
        @db = SQLite3::Database.open(ENV["BANGAZONTI"])
        check_for_closed_order = @db.execute("SELECT * FROM Orders WHERE order_id = 3")
        p check_for_closed_order
          expect(check_for_closed_order.flatten[1]).to be_an(Integer) #checks customer_id
          expect(check_for_closed_order.flatten[2]).to be_an(Integer) #checks pay_method_id
      end
    end
  end





end
