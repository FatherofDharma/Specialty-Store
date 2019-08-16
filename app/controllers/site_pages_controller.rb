class SitePagesController < ApplicationController
  def home
    @products = Product.all
    render :home
  end
end
