require "/Users/hiattcollins/workspace/bangazon/bangazon-terminal-interface/app/models/order_line.rb"

describe OrderLineModel do

  describe "#get_all_order_lines" do
    context "when get_all_order_lines called" do
      it "returns an array of all order lines" do
        order_lines = OrderLineModel.new
        all_order_lines = order_lines.get_all_order_lines
        p all_order_lines
          expect(all_order_lines).to be_an(Array)
      end
    end
  end


  describe "#add_order_line" do
    # context "before new order line is added to db" do
    #   it "checks to make sure the order line does not already exist" do
    #     order_lines = OrderLineModel.new
    #     @db = SQLite3::Database.open("/Users/hiattcollins/workspace/bangazon/bangazon-terminal-interface/bangazon_cli.db")
    #     check_for_order = @db.execute("SELECT * FROM Order_details WHERE order_detail_id = 11")
    #     p check_for_order
    #       expect(check_for_order).to eql([])
    #   end
    # end
    context "when new order line posted to the db" do
      it "successfully adds the order line to the db" do
        order_lines = OrderLineModel.new
        added_line = order_lines.add_order_line(@product_id = 5, @order_id = 4)
        p added_line
          expect(@product_id).to be_an(Integer)
          expect(@order_id).to be_an(Integer)
          expect(added_line).to be_an(Integer)
      end
    end
  end


  describe "#get_order_lines_by_order_id" do
    context "when order lines searched by order id" do
      it "returns only those order lines with that order id" do
        order_lines = OrderLineModel.new
        order_lines_by_id = order_lines.get_order_lines_by_order_id(@order_id = 4)
        p order_lines_by_id
      end
    end
  end


end
