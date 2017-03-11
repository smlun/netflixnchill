class MoviesController < ApplicationController
  before_action :authenticate_user!

  def index
    @movies = Movie.page(params[:page]).per(9)
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
