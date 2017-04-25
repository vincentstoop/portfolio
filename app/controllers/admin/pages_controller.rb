class Admin::PagesController < Admin::BaseController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  def index
    @pages = Page.all
  end

  def show
  end

  def new
    @page = current_admin.pages.build
    @page.images.build
  end

  def create
    @page = current_admin.pages.new(page_params)

    if @page.save
      image_params.each do |image|
        @page.images.create(title: title, description: description, image: image)
      end
      flash[:notice] = 'Page saved.'
      redirect_to admin_page_path(@page)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @page.update(page_params)
      image_params.each do |image|
        @page.images.create(title: title, description: description, image: image)
      end
      flash[:notice] = 'Page updated.'
      redirect_to admin_page_path(@page)
    else
      render :edit
    end
  end

  def destroy
    @page.destroy
    flash[:notice] = 'Page deleted.'
    redirect_to admin_pages_path
  end

  private

    def set_page
      @page = Page.find(params[:id])
    end

    def page_params
      params.require(:page).permit(:title, :body, :published, :admin_id, images_attributes: [:id, :title, :description, :image, :_destroy])
    end

    def image_params
      params[:images].present? ? params.require(:images) : []
  end
end
