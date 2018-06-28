class PlanetsController < ApplicationController

  def index
    begin
      @planets = DataService.instance.get_all_planets(params[:page])
    rescue SystemCallError
      $stderr.print "Failed to load Planets: " + $!
      raise
    end
  end

  def show
    if params[:id]
      begin
        @planet = DataService.instance.get_planet(params[:id])

        @residents = [] 

        @planet.residents.each do |resident_url|
          resident_id = get_id_from_uri(resident_url)
          resident = DataService.instance.get_person(resident_id)
          @residents.push(resident)
        end

        @films = [] 

        @planet.films.each do |film_url|
          film_id = get_id_from_uri(film_url)
          film = DataService.instance.get_film(film_id)
          @films.push(film)
        end

        @films = @films.sort_by { |f| f.episode_id }

      rescue SystemCallError
        $stderr.print "Failed to load Planet: " + $!
        raise
      end
    end
  end

end
