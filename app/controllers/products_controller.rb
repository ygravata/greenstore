class ProductsController < ApplicationController
  def index
  # <h1><%= params[:category].present? ? params[:category] : "All weed" %></h1>
    if params[:category].present?
      @products = Product.where(category: params[:category])
    else
      @products = Product.all
    end
  end
end
