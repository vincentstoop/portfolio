require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe "GET #index" do
    let(:admin) { create :admin}
    let(:page) { create(:page, admin: admin, portfolio_item: true) }
    let(:page2) { create(:page, admin: admin, portfolio_item: true) }
    let(:page3) { create(:page, admin: admin) }
    let(:page4) { create(:page, admin: admin) }

    it "shows the index page" do
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:portfolio_items)).to match_array([page, page2])
      expect(assigns(:pages)).to match_array([page4, page3])
    end
  end

end
