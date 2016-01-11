# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def word
 ('a'..'z').to_a.shuffle[rand(4) + 1..rand(12) + 5].join
end

def sentence
  arr = []
  t = rand(16) + 3
  t.times do
    arr << word
  end
  arr.join(" ")
end

amazing_number = 30

amazing_number.times do |i|
    a = User.new(username: "John Doe ##{i + 1}", email: "email#{i + 1}@example.com", password: "qwerqwer")
    a.save
    b = a.topics.build(title: word, content: sentence) if rand(7) > 2
    b.save if b
    b.update(counter: rand(250)) if b
end