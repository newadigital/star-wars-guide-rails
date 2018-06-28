class Vehicle < ApplicationModel

  :cargo_capacity
  :consumables
  :cost_in_credits
  :crew
  :length
  :manufacturer
  :max_atmosphering_speed
  :model
  :passengers
  :pilots
  :films
  :vehicle_class

  def get_facts
    return {
      "Capacity" => self.cargo_capacity,
      "Consumables" => self.consumables,
      "Cost" => self.cost_in_credits == "unknown" ? self.cost_in_credits : self.cost_in_credits + " Credits",
      "Crew" => self.crew,
      "Length" => self.length,
      "Manufacturer" => self.manufacturer,
      "Max Atmosphering Speed" => self.max_atmosphering_speed,
      "Model" => self.model,
      "Passengers" => self.passengers,
      "Class" => self.vehicle_class
    }
  end
  
end
