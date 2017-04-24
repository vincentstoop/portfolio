class Admin::PortfolioItemsController < Admin::BaseController
  before_action :set_portfolio_item

  def index
    @portfolio_items = PortfolioItem.all
  end

  def show
  end



  private

    def set_portfolio_item
      @portfolio_item = PortfolioItem.find(params[:id])
    end
end
