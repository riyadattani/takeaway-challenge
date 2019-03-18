require 'takeaway'
require 'order'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let(:menu) { double(:menu, print: "Salad, £1") }
  let(:order) { instance_double("Order", total: 5) }
  let(:dishes) { { salad: 2, burger: 1 } }

  it "should show a menu of dishes and prices" do
    expect(takeaway.show_menu).to eq("Salad, £1")
  end

  it "should be able to place an order of several dishes" do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

  it "knows the total order" do
    allow(order).to receive(:add)
    total = takeaway.place_order(dishes)
    expect(total).to eq(5)
  end
end
