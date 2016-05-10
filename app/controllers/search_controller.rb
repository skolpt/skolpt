class SearchController < ApplicationController
  def index
    @search = Exercise.search do
      fulltext params[:search]
    end
    @results = @search.results
  end

end