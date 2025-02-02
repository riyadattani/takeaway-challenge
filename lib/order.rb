class Order
  attr_reader :dishes

  def initialize(menu)
    @menu = menu
    @dishes = {}
  end

  def add(dish, quantity)
    fail "#{dish.capitalize} is not on the menu" unless @menu.has_dish?(dish)
    @dishes[dish] = quantity
  end

  def total
    item_totals.inject(:+)
  end

  private

  def item_totals
    dishes.map do |dish, quantity|
      menu.price(dish) * quantity
    end
  end
  attr_reader :menu
end
