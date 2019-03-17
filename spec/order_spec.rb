require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { double(:menu) }
  let(:dishes) { { salad: 2, burger: 1 } }

  before do
    allow(menu).to receive(:has_dish?).with(:salad).and_return(true)
    allow(menu).to receive(:has_dish?).with(:burger).and_return(true)
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
end
