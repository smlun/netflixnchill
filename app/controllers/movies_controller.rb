class MoviesController < ApplicationController
  before_action :set_cart, only: [:show]
  def index
    @movies = Movie.page(params[:page]).per(9)
  end

  def show
    @movie = Movie.find(params[:id])
    @line_item = LineItem.new(cart_id: @cart.id, movie_id: @movie.id)
  end
end
