class Address
  attr_accessor :city, :state, :location
  @city = nil
  @state = nil
  @location = nil

  def initialize(city, state, location)
    @city = city
    @state = state
    @location = location
  end

  def mongoize
    {city:@city, state:@state, loc: @location.mongoize}
  end

  def Address.mongoize(point_or_hash)
    if point_or_hash.nil?
      return nil
    elsif point_or_hash.is_a?(Address)
      return point_or_hash.mongoize
    elsif point_or_hash.is_a?(Hash)
      return point_or_hash
    end
  end

  def Address.demongoize(address_or_hash)
    if address_or_hash.nil?
      return nil
    elsif address_or_hash.is_a?(Address)
      return address_or_hash
    elsif address_or_hash.is_a?(Hash)
      location_hash = address_or_hash[:loc]
      location = Point.new(location_hash[:coordinates][0], location_hash[:coordinates][1])
      address = Address.new(address_or_hash[:city], address_or_hash[:state], location)
      return address
    end
  end

  def Address.evolve(point_or_hash)
    Address.mongoize(point_or_hash)
  end
end
