class WelcomeController < ApplicationController

  def index
    @sections = ['films', 'characters', 'starships', 'vehicles', 'planets']    
  end

end
