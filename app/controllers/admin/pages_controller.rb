class Admin::PagesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @page_title = "All Pages"
    @pages = Page.where(portfolio_item: false)
    @portfolio_items = Page.where(portfolio_item: true)
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page_title = "Add Page"
    @page = Page.new
    @page.photos.build
  end

  def create
    @page = Page.new(page_params)
    @page.admin = current_admin

    if @page.save
      photo_params.each do |image|
        @page.photos.create(title: title, image: image, description: description)
      end
      flash[:notice] = "Page saved."
      redirect_to admin_page_path(@page)
    else
      @page_title = "Add Page"
      render :new
    end
  end

  def edit
    @page_title = "Edit Page"
    @page = Page.find(params[:id])
    @photos = @page.photos
  end

  def update
    @page = Page.find(params[:id])

    if @page.update_attributes(page_params)
      flash[:notice] = "Page updated."
      redirect_to admin_page_path(@page)
    else
      @page_title = "Edit Page"
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
      params.require(:page).permit(:title, :body, :portfolio_item, :admin_id, photos_attributes: [:id, :title, :image, :description, :_destroy])
    end

    def photo_params
      params[:photos].present? ? params.require(:photos) : []
    end

end
