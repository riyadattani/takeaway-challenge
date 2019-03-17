require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }

  let(:menu) { double(:menu, print: "Salad, £3") }

  it "should show a menu of dishes and prices" do
    expect(takeaway.show_menu).to eq("Salad, £3")
  end

end
