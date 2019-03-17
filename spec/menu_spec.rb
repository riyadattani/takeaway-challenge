require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  let(:menu_list) { { salad: 1, burger: 3 } }

  it "shoud print a menu" do
    expect(menu.print).to eq("Salad £1, Burger £3")
  end
end
