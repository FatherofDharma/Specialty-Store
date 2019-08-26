class ProductsController< ApplicationController

  def index
    @products = Product.all
    render :index
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = {:content => "Product was successfully added to the list!", :class =>"alert alert-success"}
      redirect_to products_path
    else
      flash[:alert] = {:content => "Error! Product was not added to the list!", :class =>"alert alert-danger"}
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    render :edit
  end

  def show
    @product = Product.find(params[:id])
    render :show
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = {:content => "Product was successfully updated!", :class =>"alert alert-success"}
      redirect_to products_path
    else
      flash[:alert] = {:content => "Error! Product was not updated!", :class =>"alert alert-danger"}
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      flash[:notice] = {:content => "Product was successfully deleted!", :class =>"alert alert-success"}
      redirect_to products_path
    else
      flash[:alert] = {:content => "Error! Product was not deleted!", :class =>"alert alert-danger"}
      redirect_to product_path
    end
  end

  private
    def product_params
      params.require(:product).permit(:name, :cost, :country_of_origin)
    end

end
