FactoryGirl.define do
  factory :photo do
    image "MyString.png"
    description "MyText"
    title "MyString"
    page_id { create(:page).id }
  end
end
