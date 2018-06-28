class VehiclesController < ApplicationController

  def index
    begin
      @vehicles = DataService.instance.get_all_vehicles(params[:page])
    rescue SystemCallError
      $stderr.print 'Failed to load Vehicles: ' + $!
      raise
    end
  end

  def show
    if params[:id]
      begin
        @vehicle = DataService.instance.get_vehicle(params[:id])
        
        @pilots = []

        @vehicle.pilots.each do |pilot_url|
          pilot_id = get_id_from_uri(pilot_url)
          pilot = DataService.instance.get_person(pilot_id)
          @pilots.push(pilot)
        end

        @films = [] 

        @vehicle.films.each do |film_url|
          film_id = get_id_from_uri(film_url)
          film = DataService.instance.get_film(film_id)
          @films.push(film)
        end

        @films = @films.sort_by { |f| f.episode_id }

      rescue SystemCallError
        $stderr.print "Failed to load Vehicle: " + $!
        raise
      end
    else
      @vehicle = {}
    end
  end

end
