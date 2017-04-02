FactoryGirl.define do
  FactoryGirl.define do
    factory :page do
      title           "Page Title"
      body            "Lorem ipsum dolor sit amet contitur."
      image           ["public/project.png"]
      portfolio_item  false
      admin_id        { create(:admin).id }
    end
  end
end
