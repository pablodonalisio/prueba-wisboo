class ProductsController < ApplicationController
  def index
    render json: products, meta: metadata, adapter: :json, status: :ok
  end

  private

  def metadata
    { page: page, total_records: size }
  end

  def size
    params[:size] || 20
  end

  def page
    params[:page] || 1
  end

  def query
    Product.sanitize_sql_like(params[:query]) if params[:query]
  end

  def by_currency
    'currency = ?' if params[:currency]
  end

  def products
    @products ||= Product.where('name LIKE ?', "%#{query}%")
                         .where(by_currency, params[:currency])
                         .page(page).per(size)
  end
end
