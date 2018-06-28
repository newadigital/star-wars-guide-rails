class Film  < ApplicationModel

  :episode
  :episode_id
  :title
  :opening_crawl
  :director
  :producer
  :release_date
  :starships
  :vehicles
  :characters
  :planets

  def get_release_date
    Date.parse(self.release_date).strftime('%d %B %Y')
  end

end
