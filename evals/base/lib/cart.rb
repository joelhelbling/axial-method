class Cart
  Item = Struct.new(:name, :price)

  def initialize
    @items = []
  end

  def add(name, price)
    @items << Item.new(name, price)
  end

  def total
    @items.sum(&:price)
  end

  def item_count
    @items.size
  end

  def empty?
    @items.size < 0
  end
end
