class ProductsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource :find_by => :slug


	# url - http://localhost:3000/products
	# uri - /products
	# path - products_path
	# http method -GET
	# roles & resonsibility -to list all products
  def index
  	@products = Product.all
  end

	# url - http://localhost:3000/products/new
	# uri - /products/new
	# path -new_product_path
	# http method -GET
	# roles & resonsibility - is to setup a form for adding a new product
  def new
  	@product = Product.new
  end

	# url - http://localhost:3000/products
	# uri - /products
	# path - products_path
	# http method -POST
	# roles & resonsibility -take the data coming in form the form, pass it to the constractor as an argument, validates the object, if the validations pass insert the  record to the db and redirect the user to a new page, else display the errors on thr form
  def create
  	@product = Product.new(product_params)
  	if @product.save
  		redirect_to products_path
  	else
  		render action: 'new'
  	end
  end

	# url - http://localhost:3000/products/:id
	# uri - /products/:id
	# path - product_path(id)
	# http method -GET
	# roles & resonsibility - to find the product from the database and display it on the show page, this page will be used to show all the data about a product and also associate information like all reviews, all q&a's add product to cart.
  def show
  	@product = Product.friendly.find(params[:id])
    @review = Review.new
  end

  	# url - http://localhost:3000/products/:id/edit
	# uri - /products/:id/edit
	# path - edit_product_path(id)
	# http method -GET
	# roles & resonsibility -to find the record the user is trying to edit, and display it on a form
  def edit
  	@product = Product.friendly.find(params[:id])
  end

	# url - http://localhost:3000/products/:id
	# uri - /products/:id
	# path - product_path(id)
	# http method -PATCH
	# roles & resonsibility -find the record, the user just update in browser, and update its information by taking the data coming in from the form, validate the object, ifthe validations pass update the record to the db and redirect the user to a show page, else display the erros on the form.
  def update
  	@product = Product.friendly.find(params[:id])
  	if @product.update_attributes(product_params)
  		redirect_to product_path(@product)
  	else
  		render action: "edit"
  	end
  end

  	# url - http://localhost:3000/products/:id
	# uri - /products/:id
	# path - product_path(id)
	# http method -DELETE
	# roles & resonsibility - find the record the user is trying to delete, destroy the record and redirect to user to a index page.

  def destroy
  	@product = Product.friendly.find(params[:id])
  	@product.destroy
  	redirect_to products_path
  end

end

private
def product_params
  params[:product].permit(:name, :description, :price, :stock, :category_id, :cod_eligible, :image_url, :slug, :cover)
end