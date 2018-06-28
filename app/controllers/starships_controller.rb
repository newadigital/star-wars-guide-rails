class StarshipsController < ApplicationController

  def index
    begin
      @starships = DataService.instance.get_all_starships(params[:page])
    rescue SystemCallError
      $stderr.print "Failed to load Starships: " + $!
      raise
    end
  end

  def show
    if params[:id]
      begin
        @starship = DataService.instance.get_starship(params[:id])

        @pilots = []

        @starship.pilots.each do |pilot_url|
          pilot_id = get_id_from_uri(pilot_url)
          pilot = DataService.instance.get_person(pilot_id)
          @pilots.push(pilot)
        end

        @films = [] 

        @starship.films.each do |film_url|
          film_id = get_id_from_uri(film_url)
          film = DataService.instance.get_film(film_id)
          @films.push(film)
        end

        @films = @films.sort_by { |f| f.episode_id }
        
      rescue SystemCallError
        $stderr.print "Failed to load Starship: " + $!
        raise
      end
    end
  end

end
