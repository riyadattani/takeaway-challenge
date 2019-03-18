require 'order'
require 'menu'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { instance_double("Menu") }
  let(:dishes) { { salad: 2, burger: 1 } }

  before do
    allow(menu).to receive(:has_dish?).with(:salad).and_return(true)
    allow(menu).to receive(:has_dish?).with(:burger).and_return(true)

    allow(menu).to receive(:price).with(:salad).and_return(1)
    allow(menu).to receive(:price).with(:burger).and_return(3)
  end

  it "should add several dishes from the menu" do
    order.add(:salad, 2)
    order.add(:burger, 1)
    expect(order.dishes).to eq(dishes)
  end

  it "should raise an error if ordered something not on the menu" do
    allow(menu).to receive(:has_dish?).with(:beef).and_return(false)
    expect { order.add(:beef, 2) }.to raise_error("Beef is not on the menu")
  end

  it "calculates the total for the order" do
    order.add(:salad, 2)
    order.add(:burger, 1)
    total = 5
    expect(order.total).to eq(total)
  end
end
