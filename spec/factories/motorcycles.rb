FactoryBot.define do
  factory :motorcycle do
    title { "BMW" }
    description { "Lorem Ipsum Lorem Ipsum Lorem Ipsum" }
    year { "2020" }
    model { "X5" }
    color { "Black" }
    association :user, factory: :user
  end
end
