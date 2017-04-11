require 'rails_helper'

RSpec.feature "SeeIndexOfPages", type: :feature do
  let(:admin) { create(:admin) }
  let!(:page1) { create(:page, admin: admin, title: "Page 1") }
  let!(:page2) { create(:page, admin: admin, title: "Page 2") }
  let!(:page3) { create(:page, admin: admin, title: "Page 3",
                              portfolio_item: true) }
  let(:pages) { [page1, page2, page3] }

  describe "GET admin/pages" do

    context "when not logged in" do

      it "redirects to sign_in page" do
        visit admin_pages_path
        expect(current_path).to eq(new_admin_session_path)
        expect(page).to have_text("Log in")
        # expect(page).not_to have_text("Add Page")
      end

    end

    context "when logged in" do
      before(:example) do
        log_in_as(admin)
        visit admin_pages_path
      end

      it "shows you the Pages index, with links to those pages" do
        expect(current_path).to eq(admin_pages_path)
        expect(page.title).to include("All Pages")
        pages.each do |p|
          expect(page).to have_link(p.title, href: admin_page_path(p))
        end
      end

      it "has links to edit the different Pages" do
        pages.each do |p|
          expect(page).to have_link("Edit", href: edit_admin_page_path(p))
        end
        click_link("Edit", href: edit_admin_page_path(page2))
        expect(page).to have_field("Title", with: "Page 2")
      end

      it "has links to delete the different Pages", js: true do
        pages.each do |pagge|
          expect(page).to have_link("Delete", href: admin_page_path(pagge))
        end
        click_link("Delete", href: admin_page_path(page3))
        page.driver.browser.switch_to.alert.accept
        expect(page).not_to have_text(page3.title)
      end
    end

  end

end
