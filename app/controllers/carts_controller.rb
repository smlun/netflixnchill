class CartsController < ApplicationController
  # def index
  #   @carts = Cart.all
  # end

  def show
    @cart = Cart.find(params[:id])
    @total = @cart.calculate_total
  end

  def new
    @cart = Cart.new
  end

  def create
    @cart = Cart.create
    session[:cart] = @cart.id
  end

end
