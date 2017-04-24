class PortfolioItem < Doc
  before_create :set_portfolio_item

  def self.default_scope
    where(portfolio_item: true)
  end

  private

  def set_portfolio_item
    portfolio_item = true
  end
end
