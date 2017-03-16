class OrdersController < ApplicationController
  def index
    @orders = Order.all
    @order = Order.new

    if Cart.find_by(user_id: current_user.id)
      @cart = Cart.find_by(user_id: current_user.id)
    else
      @cart = Cart.create(user_id: current_user.id)
    end

  end

  def new
    @order = Order.new
  end

  def create
    @movie = Movie.find(params[:movie_id])

    if Cart.find_by(user_id: current_user.id)
      @cart = Cart.find_by(user_id: current_user.id)
    else
      @cart = Cart.create(user_id: current_user.id)
    end

    if Order.find_by(movie_id: @movie)
      @order = Order.find_by(movie_id: @movie)
      @order.quantity += params[:order][:quantity].to_i
    else
      @order = Order.new(movie_id: params[:movie_id], quantity: params[:order][:quantity], cart_id: @cart.id)
    end

    if @order.save
      redirect_to movies_path
      flash[:notice] = "Successfully added to cart!"
    end
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end
    def order_params
      params.require(:order).permit(:movie_id)
    end
end
