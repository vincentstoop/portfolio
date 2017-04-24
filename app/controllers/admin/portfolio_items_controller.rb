class Admin::PortfolioItemsController < Admin::BaseController

  def index
    @portfolio_items = PortfolioItem.all
  end
end
