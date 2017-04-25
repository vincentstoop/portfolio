class Admin::PortfolioItemsController < Admin::BaseController
  before_action :set_portfolio_item, only: [:show, :edit, :update, :destroy]

  def index
    @portfolio_items = PortfolioItem.all
  end

  def show
  end

  def new
    @portfolio_item = current_admin.portfolio_items.build
    @portfolio_item.images.build
  end

  def create
    @portfolio_item = current_admin.portfolio_items.new(portfolio_item_params)

    if @portfolio_item.save
      image_params.each do |image|
        @portfolio_item.images.create(title: title, description: description, image: image)
      end
      flash[:notice] = 'PortfolioItem saved.'
      redirect_to admin_portfolio_item_path(@portfolio_item)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @portfolio_item.update(portfolio_item_params)
      image_params.each do |image|
        @portfolio_item.images.create(title: title, description: description, image: image)
      end
      flash[:notice] = 'PortfolioItem updated.'
      redirect_to admin_portfolio_item_path(@portfolio_item)
    else
      render :edit
    end
  end

  def destroy
    @portfolio_item.destroy
    flash[:notice] = 'PortfolioItem deleted.'
    redirect_to admin_portfolio_items_path
  end

  private

    def set_portfolio_item
      @portfolio_item = PortfolioItem.find(params[:id])
    end

    def portfolio_item_params
      params.require(:portfolio_item).permit(:title, :body, :published, :admin_id, images_attributes: [:id, :title, :description, :image, :_destroy])
    end

    def image_params
      params[:images].present? ? params.require(:images) : []
  end
end
