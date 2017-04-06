require 'rails_helper'

RSpec.feature "EditPages", type: :feature do
  let(:admin) { create(:admin, email: 'other_admin@example.com') }
  let(:page1) { create(:page, admin: admin, photos: [create(:photo)]) }
  let(:photo) { page1.photos.first }

  describe "GET /admin/pages/:id/edit" do

    context "when not logged in" do

      it "redirects you to sign_in page" do
        visit edit_admin_page_path(page1)
        expect(current_path).to eq(new_admin_session_path)
        expect(page).to have_text("Log in")
        expect(page).not_to have_text("Edit Page")
      end

    end

    context "when logged in" do
      before(:each) {
        log_in_as(admin)

        visit edit_admin_page_path(page1)
      }

      it "shows you a pre filled in edit page" do
        expect(page.title).to eq("Edit Page")
        expect(page).to have_field("Title", with: "Page Title")
        expect(page).to have_field("Body", with: 'Lorem ipsum dolor sit amet contitur.')
        expect(page).to have_field("Portfolio Item", unchecked: true)
        within_fieldset("Photos") do
          expect(page).to have_field("Title", with: "MyString")
          expect(page).to have_field("Description", with: "MyText")
          expect(page).to have_field("Image")
        end
        expect(page).to have_xpath "//img[contains(@src,'project.jpg')]", count: 1
        expect(page).to have_link("Delete", href: admin_photo_path(photo.id))
      end

      it "lets you update the page" do
        fill_in "page_title", with: "Image is deleted"
        click_button("Save")
        expect(page).to have_selector("h1", text: "Image is deleted")
      end

      it "lets you delete attached photos" do
        expect(page).to have_link("Delete", href: admin_photo_path(photo.id))
        expect { click_link("Delete", href: admin_photo_path(photo.id)) }
        .to change { Photo.count }
        .by(-1)
        expect(current_path).to eq(admin_page_path(page1))
        expect(page).not_to have_xpath "//img[contains(@src,'project.jpg')]"
        expect(page).not_to have_link("Delete", href: admin_photo_path(photo.id))  
      end
    end
  end
end
