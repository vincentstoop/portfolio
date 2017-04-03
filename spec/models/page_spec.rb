require 'rails_helper'

RSpec.describe Page, type: :model do
  describe "factory" do
    let(:page) { build(:page) }
    it "is valid" do
      expect(page).to be_valid
    end
  end

  describe "validates" do
    describe "title" do
      let(:page) { build(:page, title: '') }
      it "must be present" do
        expect(page).not_to be_valid
      end

      it "must be of length 2 or longer" do
        page.title = "A"
        expect(page).not_to be_valid
        page.title = "AB"
        expect(page).to be_valid
      end
    end

    describe "body" do
      let(:page) { build(:page, body: '')}
      it "cannot be empty" do
        expect(page).not_to be_valid
      end
    end

    describe "image" do
      let(:page) { build(:page, image: '')}
      it "can be empty" do
        expect(page).to be_valid
      end

    end
  end

  describe "associations" do
    describe "photos" do
      let(:page) { build(:page)}
      it "can be zero" do
        expect(page).to be_valid
      end

      let(:photo1) { build(:photo, page_id: page.id) }
      let(:photo2) { build(:photo, page_id: page.id) }

      it "can be one" do
        page.photos = [photo1]
        expect(page).to be_valid
      end

      it "can be more than one" do
        page.photos = [photo1, photo2]
        expect(page).to be_valid
      end
    end

    describe "admin" do
      let(:admin) { create(:admin) }
      let(:page) { build(:page, admin_id: admin.id) }
      it "must be present" do
        expect(page).to be_valid
        page.admin_id = ''
        expect(page).not_to be_valid
      end
    end
  end
end
