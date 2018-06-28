class Starship < ApplicationModel
  
  :MGLT
  :cargo_capacity
  :consumables
  :cost_in_credits
  :crew
  :hyperdrive_rating
  :length
  :manufacturer
  :max_atmosphering_speed
  :model
  :passengers
  :films
  :pilots
  :starship_class

  def get_facts
    return {
      #"MGLT" => self.MGLT,
      "Capacity" => self.cargo_capacity,
      "Consumables" => self.consumables,
      "Cost" => self.cost_in_credits == "unknown" ? self.cost_in_credits : self.cost_in_credits + " Credits",
      "Crew" => self.crew,
      "Hyperdrive Rating" => self.hyperdrive_rating,
      "Length" => self.length,
      "Manufacturer" => self.manufacturer,
      "Max Atmosphering Speed" => self.max_atmosphering_speed,
      # "Model" => self.model,
      "Passengers" => self.passengers,
      "Class" => self.starship_class
    }
  end

end
