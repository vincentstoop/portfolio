require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe "validates" do
    let(:admin) { build(:admin) }

    describe "factory" do
      it "is valid" do
        expect(admin).to be_valid
      end
    end
    describe "name" do
      it "must be present" do
        expect(admin).to be_valid
        admin.name = ''
        expect(admin).not_to be_valid
      end

      it "must be at least 2 characters long" do
        expect(admin).to be_valid
        admin.name = 'A'
        expect(admin).not_to be_valid
      end
    end
  end
end
