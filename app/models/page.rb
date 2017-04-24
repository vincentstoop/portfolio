class Page < Doc
  before_create :set_page_item

  def self.default_scope
    where(portfolio_item: false)
  end

  private

  def set_page_item
    portfolio_item = false
  end
end
