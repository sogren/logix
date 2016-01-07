FactoryGirl.define do
  factory :valid_topic, class: Topic do
    author_id 1
    title 'Custom topic'
    content 'Custom content'
    counter 1
  end
  factory :invalid_topic, class: Topic do
    author_id :author_id
    title ''
    content 'Custom content'
    counter 1
  end
  factory :custom_topic, class: Topic do
    author_id :author_id
    title :title
    content :content
    counter 1
  end
end