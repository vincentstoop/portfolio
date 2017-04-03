require 'rails_helper'

RSpec.describe Photo, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe "validates" do
    let!(:page) { create(:page) }
    let(:photo) { build(:photo, page_id: page.id) }

    describe "factory" do
      it "is valid" do
        expect(photo).to be_valid
      end
    end

    describe "title" do
      it "must be present" do
        photo.title = ''
        expect(photo).not_to be_valid
        photo.title = 'Photo 1'
        expect(photo).to be_valid
      end
    end

    describe "image" do
      it "can not be empty" do
        photo.image = ''
        expect(photo).not_to be_valid
      end

      it "can only have extensions 'jpg, jpeg, png'" do
        photo.image = File.new(File.join(Rails.root, 'spec', 'support', 'images', 'project.jpg'))
        expect(photo).to be_valid
        photo.image = File.new(File.join(Rails.root, 'spec', 'support', 'images', 'project.jpeg'))
        expect(photo).to be_valid
        photo.image = File.new(File.join(Rails.root, 'spec', 'support', 'images', 'project.png'))
        expect(photo).to be_valid
        photo.image = File.new(File.join(Rails.root, 'spec', 'support', 'images', 'project.somethingelse'))
        expect(photo).not_to be_valid
      end
    end
  end
end
