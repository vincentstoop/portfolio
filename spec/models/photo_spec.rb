require 'rails_helper'

RSpec.describe Photo, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe "validates" do
    describe "factory" do
      let(:photo) { build(:photo) }
      it "is valid" do
        expect(photo).to be_valid
      end
    end
    describe "title" do
      let(:photo) { build(:photo) }
      it "must be present" do
        photo.title = ''
        expect(photo).not_to be_valid
        photo.title = 'Photo 1'
        expect(photo).to be_valid
      end
    end
  end
end
