class SearchController < ApplicationController
  def index
    render locals: {
      stations: SearchFacade.stations(params[:q])
    }
  end
end
