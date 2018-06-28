class FilmsController < ApplicationController
  
  def index
    begin
      @films = DataService.instance.get_all_films.each_slice(3).to_a
    rescue SystemCallError
      $stderr.print "Failed to load Films: " + $!
      raise
    end
  end

  def show
    begin
      @film = DataService.instance.get_film(params[:id])

      @characters = []

      if @film.characters
        @film.characters.take(10).each do |character_url|
            character_id = get_id_from_uri(character_url)
            character = DataService.instance.get_person(character_id)
            @characters.push(character)
        end
      end

      @starships = []

      if @film.starships
        @film.starships.take(10).each do |starship_url|
            starship_id = get_id_from_uri(starship_url)
            starship = DataService.instance.get_starship(starship_id)
            @starships.push(starship)
        end
      end

      @planets = []
      
      if @film.planets
        @film.planets.take(10).each do |planet_url|
          planet_id = get_id_from_uri(planet_url)
          planet = DataService.instance.get_planet(planet_id)
          @planets.push(planet)
        end
      end

      i = @film.id.to_i
      
      if i == 6
        _next = 1
      elsif i == 3
        _next = 7
      elsif i == 7
        _next = 0
      else
        _next = i + 1
      end

      if i == 1
        _previous = 6
      elsif i == 7
        _previous = 3
      elsif i == 4
        _previous = 0
      else
        _previous = i - 1
      end

      @next = _next
      @previous = _previous

    rescue SystemCallError
      $stderr.print "Failed to load Film data: " + $!
      raise
    end

  end

  def anthology_films
    # get the Anthology Films data ...
    # 1. Rogue One: A Star Wars Story
    # 2. Han Solo
    # 3. Boba Fett
  end

end
