# app/models/driver.rb
class Driver
  belongs_to(
    :bus,
    class_name: "Bus",
    foreign_key: :bus_id,
    primary_key: :id
  )
end


# app/models/bus.rb
class Bus
  belongs_to(
    :route,
    class_name: "Route",
    foreign_key: :route_id,
    primary_key: :id,
  )

  has_many(
    :drivers,
    class_name: "Driver",
    foreign_key: :bus_id,
    primary_key: :id,
  )
end


# app/models/route.rb
class Route
  has_many(
    :buses,
    class_name: "Bus",
    foreign_key: :route_id,
    primary_key: :id
  )

  has_many :drivers,
    through: :buses,
    source: :drivers

  def n_plus_one_drivers
    buses = self.buses

    all_drivers = {}
    buses.each do |bus|
      drivers = []
      bus.drivers.each do |driver|
        drivers << driver.name
      end
      all_drivers[bus.id] = drivers
    end

    all_drivers
  end
  # Create a hash with bus id's as keys and an array of bus drivers
  # as the corresponding value => {'1' => ['Joan Lee', 'Charlie McDonald',
  # 'Kevin Quashie'], '2' => ['Ed Michaels', 'Lisa Frank', 'Sharla Alegria']}

  def better_drivers_query
    all_drivers = {}
    buses = self.buses.includes(:drivers => :name)
    buses.each do |bus|
      bus.drivers.each do |driver|
        all_drivers[bus] = driver.name
      end
    end
    all_drivers
  end
end
