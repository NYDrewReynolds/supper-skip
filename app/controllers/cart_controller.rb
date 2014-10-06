class CartController < ApplicationController
  def edit
    @cart = Cart.build(session[:cart])
  end

  def add_item
    @item_id = params[:item_id]
    session[:cart] ||= []
    session[:cart] << @item_id
    flash[:notice] = "Item added to your cart!"

    redirect_to items_path
    #respond_to do |format|
    #  format.js { @item_id } 
    #end
  end

  def remove_item
    @item_id = params[:item_id]
    session[:cart].delete(@item_id)

    respond_to do |format|
      format.js { @item_id }
    end
  end

  def destroy
    session[:cart].clear
    redirect_to request.referer 
  end
end
