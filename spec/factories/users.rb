FactoryBot.define do
  factory :user do
    id { 1 }
    name { "Rails" }
    email { "rails@gmail.com" }
    password { "Railsrails" }
    password_confirmation { "Railsrails" }
  end
end
