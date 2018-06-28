require "singleton"

class DataService
    include Singleton
    include ApplicationHelper

    def initialize()
    end

    def get_all_people(page = "1")

        !validate(page) ? page = "1" : page

        cache_key = ["sw_people_" + page] 
        
        return Rails.cache.fetch(cache_key, expires_in: 24.hours) do

            response = Swapi.get_all("people", page)
            obj = JSON.parse(response)
      
            _people_array = []

            obj["results"].each do |character|
                character["id"] = get_id_from_uri(character["url"])
                character["section"] = "characters"
                _people_array.push(Character.new(character))
            end
 
            return PagerModel.new(
                    _people_array.sort_by { |p| p.name },
                    obj["count"],
                    obj["next"],
                    obj["previous"])

        end
    end

    def get_person(id)
        if id
            cache_key = ["sw_person_" + id] 
            _person = Rails.cache.fetch(cache_key, expires_in: 24.hours) do   
                response = Swapi.get_person id
                obj = JSON.parse(response)

                obj["id"] = id
                obj["section"] = "characters"

                _person =  Character.new(obj)
            
            end

            return _person;
        end
    end

    def get_all_films(page = "1")
                
        !validate(page) ? page = "1" : page

        cache_key = ["sw_films_" + page] 
        
        return Rails.cache.fetch(cache_key, expires_in: 24.hours) do  
        
            _film_ids = [4,5,6,1,2,3,7,8,9]
            _films_array = []

            response = Swapi.get_all("films", "1")
            obj = JSON.parse(response)

            obj["results"].each do |film|
                _film_image = "sw-episode-" + film["episode_id"].to_s
                _film_index = film["episode_id"] - 1

                film["id"] = _film_ids[_film_index]
                film["episode_id"] = film["episode_id"] 
                film["section"] = "films"
                film["episode"] = "Episode " + numerals[_film_index]
                film["name"] = _film_image

                _films_array.push(Film.new(film))

            end

            return _films_array.sort_by { |f| f.episode_id }

        end
    end

    def get_film(id)
        if id

            cache_key = ["sw_film_" + id] 
            _film = Rails.cache.fetch(cache_key, expires_in: 24.hours) do

                response = Swapi.get_film id
                obj = JSON.parse(response)

                _ep = obj["episode_id"] - 1
                _numeral = numerals[_ep]

                obj["id"] = id
                obj["section"] = "films"
                obj["episode"] = "Episode " + _numeral
                obj["name"] = "sw-episode-" + obj["episode_id"].to_s

                _film =  Film.new(obj)

            end

            return _film

        else
            return {}
        end
    end

    def get_all_starships(page = "1")

        !validate(page) ? page = "1" : page

        cache_key = ["sw_starships_" + page] 
        
        return Rails.cache.fetch(cache_key, expires_in: 24.hours) do
           
            _starships_array = []

            response = Swapi.get_all("starships", page)
            obj = JSON.parse(response)

            obj["results"].each do |starship|
                starship["id"] = get_id_from_uri(starship["url"])
                starship["section"] = "starships"
                _starships_array.push(Starship.new(starship))
            end

            return PagerModel.new(
                    _starships_array.sort_by { |s| s.name },
                    obj["count"],
                    obj["next"],
                    obj["previous"])

        end
    end

    def get_starship(id)
        if id
            cache_key = ["sw_starship_" + id] 
            _starship = Rails.cache.fetch(cache_key, expires_in: 24.hours) do 

                response = Swapi.get_starship id
                obj = JSON.parse(response)

                obj["id"] = id
                obj["section"] = "starships"

                _starship = Starship.new(obj)

            end

            return _starship
        else
            return {}
        end
    end

    def get_all_vehicles(page = "1")

        !validate(page) ? page = "1" : page

        cache_key = ["sw_vehicles_" + page] 
        
        return Rails.cache.fetch(cache_key, expires_in: 24.hours) do
            _vehicles_array = []
            response = Swapi.get_all("vehicles", page)
            obj = JSON.parse(response)

            obj["results"].each do |vehicle|
                vehicle["id"] = get_id_from_uri(vehicle["url"])
                vehicle["section"] = "vehicles"
                _vehicles_array.push(Vehicle.new(vehicle))
            end

            return PagerModel.new(
                    _vehicles_array.sort_by { |v| v.name },
                    obj["count"],
                    obj["next"],
                    obj["previous"])

        end
    end

    def get_vehicle(id)
        if id
            cache_key = ["sw_vehicle_" + id] 
            _vehicle = Rails.cache.fetch(cache_key, expires_in: 24.hours) do

                response = Swapi.get_vehicle id
                obj = JSON.parse(response)

                obj["id"] = id
                obj["section"] = "vehicles"

                _vehicle =  Vehicle.new(obj)

            end
      
            return _vehicle
        else
            return {}
        end
    end

    def get_all_planets(page = "1")

        !validate(page) ? page = "1" : page

        cache_key = ["sw_planets_" + page] 
        
        return Rails.cache.fetch(cache_key, expires_in: 24.hours) do
            _planets_array = []
            response = Swapi.get_all("planets", page)
            obj = JSON.parse(response)

            obj["results"].each do |planet|
                planet["id"] = get_id_from_uri(planet["url"])
                planet["section"] = "planets"
                _planets_array.push(Planet.new(planet))
            end

            return PagerModel.new(
                    _planets_array.sort_by { |p| p.name },
                    obj["count"],
                    obj["next"],
                    obj["previous"])

        end

    end

    def get_planet(id)
        if id
            cache_key = ["sw_planet_" + id] 
            _planet = Rails.cache.fetch(cache_key, expires_in: 24.hours) do
                response = Swapi.get_planet id
                obj = JSON.parse(response)

                obj["id"] = id
                obj["section"] = "planets"

                _planet =  Planet.new(obj)

            end
  
            return _planet
        else
            return {}
        end
    end

    private
    def validate(value)
        if value.nil? || value == "0"
         return false
        end

        return true
    end
end