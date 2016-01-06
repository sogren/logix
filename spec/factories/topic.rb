FactoryGirl.define do
  factory :valid_topic, class: Topic do
    author_id 1
    title "abrer"
  end
  factory :invalid_topic, class: Topic do
    author_id :author_id
    title ''
  end
  factory :custom_topic, class: Topic do
    author_id :author_id
    title :title
  end
end