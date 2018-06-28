
class ApiController < ActionController::API

  def index
  end

  def show
    obj = {};
    case params[:id]
    when 'films'
      obj = DataService.instance.get_all_films
    when 'characters'
      obj = DataService.instance.get_all_people
    when 'starships'
      obj = DataService.instance.get_all_starships
    when 'planets'
      obj = DataService.instance.get_all_planets
    when 'vehicles'
      obj = DataService.instance.get_all_vehicles
    else
      # ...
    end

    # TODO: define image url
    # TODO: remove swapi urls

    json_response(obj)
  end

  def get_film
    if params[:id]
      @film = DataService.instance.get_film params[:id]
      json_response(@film)
    end
  end

  def get_character
    if params[:id]
      @person = DataService.instance.get_person params[:id]
      json_response(@person)
    end
  end

  def get_starship
    if params[:id]
      @starship = DataService.instance.get_starship params[:id]
      json_response(@starship)
    end
  end

  def get_vehicle
    if params[:id]
      @vehicle = DataService.instance.get_vehicle params[:id]
      json_response(@vehicle)
    end
  end

  def get_planet
    if params[:id]
      @planet = DataService.instance.get_planet params[:id]
      json_response(@planet)
    end
  end

  def json_response(object, status = :ok)
      render json: object, status: status
  end

end
