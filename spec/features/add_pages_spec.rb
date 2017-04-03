require 'rails_helper'

RSpec.feature "AddPages", type: :feature do
  let(:admin) { create(:admin) }
  # before(:each) do
  #   log_in_as(admin)
  # end

  describe "GET /admin/pages/new" do
    it "redirects to sign_in page when not logged in" do
      visit new_admin_page_path
      expect(current_path).to eq(new_admin_session_path)
      expect(page).to have_text("Log in")
      expect(page).not_to have_text("Add Page")
      fill_in "admin_email", with: admin.email
      fill_in "admin_password", with: admin.password
      click_button("Log in")
      expect(current_path).to eq(new_admin_page_path)
      expect(page).to have_text("Add Page")
      expect(page.title).to eq("Add Page")
    end

    it "lets you create a new page when logged in" do
      log_in_as(admin)
      visit new_admin_page_path
      expect(current_path).to eq(new_admin_page_path)
      expect(page).to have_text("Add Page")
      expect(page.title).to eq("Add Page")
      fill_in "page_title", with: "Portfolio Item"
      fill_in "page_body", with: "This is a portfolio item."
      check("page_portfolio_item")
      click_button("Save")
      expect(page).to have_text("Page saved.")
      expect(page).to have_text("Portfolio Item")
    end
  end
end
