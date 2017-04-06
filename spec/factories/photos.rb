FactoryGirl.define do
  image_src = File.join(Rails.root, 'spec', 'support', 'images', 'project.jpg')
  src_file = File.new(image_src)
  factory :photo do
    image src_file
    description "MyText"
    title "MyString"
    page { create(:page) }
  end
end
