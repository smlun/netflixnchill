class LineItemsController < ApplicationController
  before_action :set_cart

  def create
    movie_id = params[:line_item][:movie_id].to_i
    quantity = params[:line_item][:quantity].to_i
    @cart.stack_to_cart(movie_id, quantity)

    redirect_to movies_path, notice: "Successfully added to cart!"
  end

  def destroy
  end

  def update
  end

  def index
    @line_items = @cart.line_items
  end

private
  def line_items_params
    params.require(:line_item).permit(:movie_id, :quantity)
  end

end
