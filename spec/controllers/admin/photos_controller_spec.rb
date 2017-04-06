require 'rails_helper'

RSpec.describe Admin::PhotosController, type: :controller do

  describe "DELETE #destroy" do
    let!(:image) { create(:photo) }
    
    it "deletes an image" do
      expect { delete :destroy, params: { id: image.id } }
        .to change { Photo.count }
        .by(-1)
    end
  end

end
