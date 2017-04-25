class Admin::PortfolioItemsController < Admin::BaseController
  before_action :set_portfolio_item, only: [:show]

  def index
    @portfolio_items = PortfolioItem.all
  end

  def show
  end

  def new
    @portfolio_item = PortfolioItem.new
  end

  def create
    @portfolio_item = PortfolioItem.new(portfolio_item_params)

    if @portfolio_item.save
      flash[:notice] = 'PortfolioItem saved'
      redirect_to admin_portfolio_item_path(@portfolio_item)
    else
      render 'new'
    end
  end


  private

    def set_portfolio_item
      @portfolio_item = PortfolioItem.find(params[:id])
    end

    def portfolio_item_params
      params.require(:portfolio_item).permit(:title, :body, :published)
    end
end
