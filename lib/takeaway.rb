require 'order'
require 'sms'

class Takeaway
  attr_reader :menu, :order, :sms

  def initialize(menu:, config:,order: nil, sms: nil)
    @menu = menu
    @order = order || Order.new(menu)
    @sms = sms || SMS.new(config)
  end

  def show_menu
    @menu.print
  end

  def place_order(dishes)
    add_dishes(dishes)
    sms.deliver
    order.total
  end

  private

  def add_dishes(dishes)
    dishes.each do |dish, quantity|
      @order.add(dish, quantity)
    end
  end
end
