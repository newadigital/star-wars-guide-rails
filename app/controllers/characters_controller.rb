class CharactersController < ApplicationController

  def index
    begin
      @characters = DataService.instance.get_all_people(params[:page])
    rescue SystemCallError
      $stderr.print "Failed to load Characters: " + $!
      raise
    end

  end

  def show
    if params[:id]
      begin
        @character = DataService.instance.get_person(params[:id])
        @homeworld = DataService.instance.get_planet(get_id_from_uri(@character.homeworld))

        @character.homeworld = @homeworld
        
        @films = []
  
        @character.films.each do |film_url|
          film_id = get_id_from_uri(film_url)
          film = DataService.instance.get_film(film_id)
          @films.push(film)
        end

        @films = @films.sort_by { |f| f.episode_id }

        @starships = []
  
        @character.starships.each do |starship_url|
          starship_id = get_id_from_uri(starship_url)
          starship = DataService.instance.get_starship(starship_id)
          @starships.push(starship)
        end

      rescue SystemCallError
        $stderr.print "Failed to load Character: " + $!
        raise
      end

    end
  end



end
