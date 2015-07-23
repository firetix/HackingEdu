class UsersController < ApplicationController

  def get_wish_list
    productIds  = params[:products]
    products = []
    if productIds
      products =  Product.find(productIds.split(','))
    end
    render :json => {:products => products}
  end
end
