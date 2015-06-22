class SearchController < ApplicationController

  def hotels_search
    @results = Hotel.search(params[:query]).paginate(per_page: 10, page: params[:page] )
  end
end
