FactoryGirl.define do
  factory :admin do
    name                    "Admin User"
    email                   "admin@localhost.com"
    password                "password"
    password_confirmation   "password"
  end
end
