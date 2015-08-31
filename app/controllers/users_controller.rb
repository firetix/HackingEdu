class UsersController < ApplicationController

  def get_wish_list
    productIds  = params[:products]
    products = []
    if productIds
      products =  Product.find(productIds.split(','))
    end
    render :json => {:products => products}
  end
  def get_brands_sub_list
    brands  = params[:brands]
    products = []
    if brands
      products =  Product.find_by_manufacturer(brands.split(','))
    end
    render :json => {:products => products}
  end
end
