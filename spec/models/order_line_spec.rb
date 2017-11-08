require_relative "../../app/models/order_line.rb"

describe "Order Line Model" do

  describe ".get_all_order_lines" do
    context "when called" do
      it "returns an array of all order lines" do
        order_lines = OrderLineModel.new
        all_order_lines = order_lines.get_all_order_lines
          expect(all_order_lines).to be_an(Array)
      end
    end
  end


  describe ".add_order_line" do

    # ***** The order line number needs to be set to an order that does not yet exist *****
    context "before new order line is added to db" do
      it "checks to make sure the order line does not already exist" do
        order_lines = OrderLineModel.new
        @db = SQLite3::Database.open(ENV["BANGAZONTI"])
        check_for_order = @db.execute("SELECT * FROM Order_details WHERE order_detail_id = 23")
          expect(check_for_order).to eql([])
      end
    end


    context "when new order line posted to the db" do
      it "successfully adds the order line to the db" do
        order_lines = OrderLineModel.new
        added_line = order_lines.add_order_line(@product_id = 5, @order_id = 4)
          expect(@product_id).to be_an(Integer)
          expect(@order_id).to be_an(Integer)
          expect(added_line).to be_an(Integer)
      end
    end
  end

  # ***** The order line number needs to be set to the order created above *****
  describe ".delete_order_line" do
    context "when order line deleted by order line id" do
      it "successfully deletes the order line corresponding to the id submitted" do
        order_lines = OrderLineModel.new
        order_lines.delete_order_line(23)
        @db = SQLite3::Database.open(ENV["BANGAZONTI"])
        check_for_line = @db.execute("SELECT * FROM Order_details WHERE order_detail_id = 23")
          expect(check_for_line).to eql([])
      end
    end
  end

  describe ".get_order_lines_by_order_id" do
    context "when order lines searched by order id" do
      it "returns only those order lines with that order id" do
        order_lines = OrderLineModel.new
        order_lines_by_order_id = order_lines.get_order_lines_by_order_id(@order_id = 4)
        expect(order_lines_by_order_id[0][2]).to eql(4)
      end
    end
  end

  describe ".get_order_lines_by_product_id" do
    context "when order lines searched by product id" do
      it "returns only those order lines with that product id" do
        order_lines = OrderLineModel.new
        order_lines_by_product_id = order_lines.get_order_lines_by_product_id(@product_id = 2)
        expect(order_lines_by_product_id[0][1]).to eql(2)
      end
    end
  end

  describe ".get_products_from_current_orders" do
    context "when called" do
      it "returns the product IDs of all active orders" do
        active_orders = OrderLineModel.new
        product_ids = active_orders.get_products_from_current_orders
        expect(product_ids).to be_an(Array)
      end
    end
  end

  describe "get_grand_total_by_order_id" do
    context "when order lines searched by order id when order exists" do
      it "returns the order number and grand total of item costs in that order" do
        order_lines = OrderLineModel.new
        grand_total_by_order_id = order_lines.get_grand_total_by_order_id(@order_id = 3)
        grand_total_by_order_id = grand_total_by_order_id.flatten
        p grand_total_by_order_id
        expect(grand_total_by_order_id[0]).to eql(3)
        expect(grand_total_by_order_id[1]).to be > 0
      end
    end

    context "when order lines searched by order id when order doesn't exist" do
      it "returns nil for both the order number and the total cost" do
        order_lines = OrderLineModel.new
        grand_total_by_order_id = order_lines.get_grand_total_by_order_id(@order_id = 4)
        grand_total_by_order_id = grand_total_by_order_id.flatten
        p grand_total_by_order_id
        expect(grand_total_by_order_id[0]).to be(nil)
        expect(grand_total_by_order_id[1]).to be(nil)
      end
    end
  end

end
