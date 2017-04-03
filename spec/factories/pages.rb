FactoryGirl.define do
  factory :page do
    title           "Page Title"
    body            "Lorem ipsum dolor sit amet contitur."
    portfolio_item  false
    admin_id        { create(:admin).id }
  end
end
