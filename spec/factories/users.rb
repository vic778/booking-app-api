FactoryBot.define do
  factory :user do
    name { "Rails" }
    email { "rails@gmail.com" }
    password { "Railsrails" }
    password_confirmation { "Railsrails" }
  end
end
