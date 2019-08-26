class ReviewsController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
    render :new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = {:content => "Review was successfully created!", :class =>"alert alert-success"}
      redirect_to product_path(@product)
    else
      flash[:alert] = {:content => "Error! Review was not created!", :class =>"alert alert-danger"}
      render :new
    end
  end

  def edit
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :edit
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = {:content => "Review was successfully updated!", :class =>"alert alert-success"}
      redirect_to product_path(@review.product)
    else
      flash[:alert] = {:content => "Error! Review was not updated!", :class =>"alert alert-danger"}
    render :edit
    end
  end

  def show
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :show
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      flash[:notice] = {:content => "Review was successfully updated!", :class =>"alert alert-success"}
      redirect_to product_path(@review.product)
    else
      flash[:alert] = {:content => "Error! Review was not deleted!", :class =>"alert alert-danger"}
      redirect_to product_path(@revew.product)
    end

  end

  private
    def review_params
      params.require(:review).permit(:author, :content_body, :rating)
    end

end
