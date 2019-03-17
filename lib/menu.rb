class Menu
  attr_reader :menu_list

  def initialize(menu_list)
    @menu_list =  { salad: 1, burger: 3 }
  end

  def print
    @menu_list.map { |dish, price| "#{dish.capitalize} £#{price}" }.join(", ")
  end
end
