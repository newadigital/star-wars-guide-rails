class Planet < ApplicationModel

  :diameter
  :rotation_period
  :orbital_period
  :gravity
  :population
  :climate
  :terrain
  :surface_water
  :residents
  :films

  def section_a
    "planets"
  end
  
  def get_facts
    _surface_water = self.surface_water
    
    if self.surface_water != "unknown" 
      _surface_water +="%"
    end

    return {
      "Diameter" => self.diameter,
      "Rotation Period" => self.rotation_period == "unknown" ? self.rotation_period : self.rotation_period + " Hrs",
      "Orbital Period" => self.rotation_period == "unknown" ? self.rotation_period : self.rotation_period + " Days",
      "Gravity" => self.gravity,
      "Population" => self.population,
      "Climate" => self.climate,
      "Terrain" => self.terrain,
      "Surface Water" => _surface_water
    }
  end

end
