require 'rails_helper'

RSpec.feature "ShowPage", type: :feature do
  let(:admin) { create(:admin) }
  let(:page1) { create(:page, title: "Show me this page", admin: admin) }

  describe "GET admin/pages/:id" do
    before(:example) { visit admin_page_path(page1) }

    context "when not logged in" do

      it "redirects to the sign_in page" do
        visit admin_page_path(page1)
        expect(current_path).to eq(new_admin_session_path)
        expect(page).to have_text("Log in")
      end

    end

    context "when logged in" do
      before(:example) do
        log_in_as(admin)
        visit admin_page_path(page1)
      end

      it "shows you the page" do
        expect(current_path).to eq(admin_page_path(page1))
        expect(page).to have_selector("h1", text: "Show me this page")
      end

      it "has a link to edit the page" do
        expect(page).to have_link("Edit", href: edit_admin_page_path(page1))
      end

      it "has a link to delete the page"

    end

  end
end
