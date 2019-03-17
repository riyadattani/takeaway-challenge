require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let(:menu) { double(:menu, print: "Salad, £1") }
  let(:order) { double(:order) }
  let(:dishes) { { salad: 2, burger: 1 } }

  it "should show a menu of dishes and prices" do
    expect(takeaway.show_menu).to eq("Salad, £1")
  end

  it "should be able to place an order of several dishes" do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end
end
