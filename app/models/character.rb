class Character < ApplicationModel

  :birth_year
  :eye_color
  :films
  :gender
  :hair_color
  :height
  :homeworld
  :mass

  def get_facts
    return {
      "DOB" => self.birth_year,
      "Gender" => self.gender,
      "Height" => self.height == "unknown" ? self.height : self.height + "cm",
      "Homeworld" => self.homeworld.name
    }
  end

end
