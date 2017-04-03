class Admin::PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      flash[:notice] = "Pagina is opgeslagen."
      redirect_to admin_pages_path
    else
      render :new
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])

    if @page.update_attributes(page_params)
      flash[:notice] = "Paginawijziging is opgeslagen."
      redirect_to admin_page_path(@page)
    else
      render :edit
    end
  end

  def destroy
  end

  private

    def page_params
      params.require(:page).permit(:title, :body, :portfolio_item, :admin_id)
    end
end
