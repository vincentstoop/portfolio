require 'rails_helper'

RSpec.describe Admin::PagesController, type: :controller do
  let(:page) { create(:page, title: 'Test PagesController') }
  let(:admin) { page.admin }

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:admin2]
    admin2 = page.admin
    sign_in admin2, scope: :admin # sign_in(scope, resource)
  end

  describe "GET #index" do
    it "shows the index page" do
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:pages)).to eq([page])
    end
  end

  describe "GET #show" do
    it "shows a single page" do
      get :show, params: { id: page.id }
      expect(response).to have_http_status(:success)
      expect(assigns(:page).title).to eq("Test PagesController")
    end
  end

  describe "GET #new" do
    it "shows the new Page page" do
      get :new
      expect(response).to have_http_status(:success)
      expect(assigns(:page)).to be_a_new(Page)
    end
  end

  describe "GET #edit" do
    it "show the edit Page page" do
      get :edit, params: { id: page.id }
      expect(response).to have_http_status(:success)
      expect(assigns(:page).title).to eq('Test PagesController')
      expect(assigns(:page).title).not_to eq('Update PagesController')
    end
  end

  describe "POST #create" do
    it "creates a page" do
      post :create, params: { page: { title: "Page creation", body: "This is a test body", portfolio_item: true, admin_id: admin.id } }
      # expect(response).to redirect_to(admin_page_path(page.id))
      expect(flash[:notice]).not_to be_empty
      expect(assigns(:page).title).to eq("Page creation")
    end
  end

  describe "PUT #update" do
    it "updates a page" do
      put :update, params: { id: page.id, page: { title: 'Update PagesController' } }
      expect(response).to redirect_to(admin_page_path(page))
      expect(flash[:notice]).not_to be_empty
      expect(assigns(:page).title).to eq('Update PagesController')
    end
  end

  describe "DELETE #destroy" do
    it "redirects to admin pages path" do
      delete :destroy, params: { id: page.id }
      expect(response).to redirect_to(admin_pages_path)
      expect(flash[:notice]).not_to be_empty
    end

    it "deletes the Page from database" do
      page.touch

      expect { delete :destroy, params: { id: page.id } }
        .to change { Page.count }
        .by(-1)
    end
  end

end
