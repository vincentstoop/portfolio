class PagesController < ApplicationController
  def index
    @pages = Page.where(portfolio_item: false)
    @portfolio_items = Page.where(portfolio_item: true)
  end
end
