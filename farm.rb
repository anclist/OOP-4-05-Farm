
class Farm

  @@fields = []
  @@harvested = 0

  attr_accessor :kind, :size, :productivity

  def initialize(kind, size)
    @kind = kind
    @size = size
    if kind == "corn"
      @productivity = 20
    elsif kind == "wheat"
      @productivity = 30
    else
      @productivity = 0
    end
  end

  def self.create(kind, size)
    new_field = Farm.new(kind, size)
    @@fields << new_field
    new_field
  end

  def self.harvest
    @@fields.each do |field|
      @@harvested += field.production
    end
  end

  def production
    production = self.size.to_i * self.productivity.to_i
  end
  def self.harvested
    @@harvested
  end

  def self.fields
    @@fields
  end

  def self.hectares(kind)
    total_hectares = 0
    @@fields.each do |field|
      if field.kind == kind
        total_hectares += field.size.to_i
      end
    end
    return total_hectares
  end

end
