class Cart
  Item = Struct.new(:name, :price)
  class UnknownCode < StandardError; end

  def initialize
    @items = []
  end

  def add(name, price)
    @items << Item.new(name, price)
  end

  def apply_code(c)
    if c == "SAVE10"
      @dc = 0.10
    else
      if c == "SAVE20"
        @dc = 0.20
      else
        if c == "FIVER"
          @f = true
        else
          raise UnknownCode
        end
      end
    end
  end

  def total
    t = @items.sum(&:price)
    if @dc
      t = t - (t * @dc)
    end
    if @f
      t = t - 5.0
      if t < 0
        t = 0
      end
    end
    t
  end

  def item_count
    @items.size
  end

  def empty?
    @items.size < 0
  end
end
