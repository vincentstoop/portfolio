require 'rails_helper'

RSpec.feature "AddPages", type: :feature do
  let(:admin) { create(:admin) }

  describe "GET /admin/pages/new" do

    context "when not logged in" do

      it "redirects to sign_in page" do
        visit new_admin_page_path
        expect(current_path).to eq(new_admin_session_path)
        expect(page).to have_text("Log in")
        expect(page).not_to have_text("Add Page")
      end

    end

    context "when logged in" do

      before(:each) { log_in_as(admin) }

      describe "lets you create a page" do
        let(:image1) { 'project.jpg' }
        let(:image2) { 'project.png' }
        let(:path1) { File.join(Rails.root, 'spec', 'support', 'images', image1) }
        let(:path2) { File.join(Rails.root, 'spec', 'support', 'images', image2) }

        it "without images" do
          visit new_admin_page_path
          expect(page).to have_text("Add Page")
          expect(page.title).to eq("Add Page")
          fill_in "page_title", with: "Portfolio Item"
          fill_in "page_body", with: "This is a portfolio item."
          check("page_portfolio_item")
          fill_in "page_photos_attributes_0_title", with: nil
          click_button("Save")
          expect(page).to have_text("Page saved.")
          expect(page).to have_text("Portfolio Item")
          expect(page.title).to include("Portfolio Item")
        end

        it "with an image" do
          visit new_admin_page_path
          expect(page).to have_text("Add Page")
          expect(page.title).to eq("Add Page")
          fill_in "page_title", with: "Portfolio Item"
          fill_in "page_body", with: "This is a portfolio item."
          check("page_portfolio_item")
          fill_in "page_photos_attributes_0_title", with: "Project Photo"
          attach_file('Image', path1)
          click_button("Save")
          expect(page).to have_text("Page saved.")
          # debugger
          expect(page).to have_text("Portfolio Item")
          expect(page.title).to include("Portfolio Item")
          expect(page.body).to have_xpath "//img[contains(@src,'project.jpg')]", count: 1
        end

      end


      it "returns you to a pre filled in form when saving fails" do
        visit new_admin_page_path
        expect(page).to have_text("Add Page")
        expect(page.title).to eq("Add Page")
        fill_in "page_title", with: 'Failure example'
        fill_in "page_body", with: ''
        click_button("Save")
        expect(page).to have_text("Add Page")
        # debugger
        expect(page).to have_text("Body can't be blank")
        expect(page).to have_field("Title", with: "Failure example")
        expect(page).to have_field("Body", with: "")
        expect(page).to have_field("Portfolio Item", checked: false)
      end
      # a_page = create(:page, admin: admin)
      # visit edit_admin_page_path(a_page.id)

    end

  end
end
