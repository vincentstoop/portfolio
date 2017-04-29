class Admin::DocsController < Admin::BaseController
  def index
    @pages = Page.all
    @portfolio_items = PortfolioItem.all
  end

  def update
    @doc = Doc.find(params[:id])
    if @doc.update_attributes(published: !!!@doc.published)
      redirect_to admin_docs_path
    end
  end
end
