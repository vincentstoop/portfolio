class Admin::PagesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page_title = "Add Page"
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    @page.admin = current_admin

    if @page.save
      flash[:notice] = "Page saved."
      redirect_to admin_page_path(@page)
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
    @page = Page.find(params[:id])
    if @page.destroy
      flash[:notice] = "Pagina is verwijderd"
      redirect_to admin_pages_path
    end
  end

  private

    def page_params
      params.require(:page).permit(:title, :body, :portfolio_item, :admin_id)
    end
end
