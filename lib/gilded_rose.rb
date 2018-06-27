class GildedRose
  attr_reader :name, :days_remaining, :quality

  def initialize(name:, days_remaining:, quality:)
    @name = name
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
    return if @name == "Sulfuras, Hand of Ragnaros"

    @days_remaining = @days_remaining - 1

    if @name == "Aged Brie"
      increase_quality
      increase_quality if @days_remaining < 0
    elsif @name == "Backstage passes to a TAFKAL80ETC concert"
      if @days_remaining < 0
        @quality = 0 
      else
        increase_quality

        if @days_remaining < 10
          increase_quality
        end

        if @days_remaining < 5
          increase_quality
        end
      end
    else # normal item
      decrease_quality
      decrease_quality if @days_remaining < 0
    end
  end

  def increase_quality
    @quality += 1 if @quality < 50
  end

  def decrease_quality
    if @quality > 0
      @quality -= 1
    end
  end
end
