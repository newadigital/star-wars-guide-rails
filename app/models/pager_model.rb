class PagerModel
  extend ActiveModel::Naming
  attr_reader :results, :count, :next_page, :previous_page, :is_last, :is_first

  def initialize(results, count, next_page, previous_page)

    # If the next_page is nil then we are at the end
    if next_page.nil?
      next_page = ""
      @is_last = true
    else
      next_page = get_page_params(next_page, "page").to_s
      # page 0 is the same as page 1
      if next_page == "0" && next_page == "1"
        next_page = "2"
      end

      @is_last = false
    end

    # If the previous_page is nil then we are at the start
    if previous_page.nil?
      previous_page = ""
      @is_first = true
    else
      previous_page = get_page_params(previous_page, "page").to_s
      # page 0 is the same as page 1
      if previous_page == "0" # || previous_page == "1"
        previous_page = "1"
      end
      @is_first = false
    end

    @results = results
    @count = count
    # @next_page = next_page == "" ? "" : "?page=" + next_page
    @next_page = @is_last ? "" : "?page=" + next_page
    # @previous_page = previous_page == "" ? "" : "?page=" + previous_page
    @previous_page = @is_first ? "" : "?page=" + previous_page

  end

  private

  def get_page_params(url, name)
      uri = URI.parse(url)
      params = CGI.parse(uri.query)
      return params["page"].first.to_s
  end
end
