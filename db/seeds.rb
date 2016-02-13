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

def fill_map
  arr = []
  13.times do |i|
    arr[i] = []
    13.times do |k|
      if i == 0 or i == 12 or k == 0 or k == 12
        arr[i][k] = 1
      else
        arr[i][k] = 0
      end
    end
  end
  arr
end

hash_blocks = { r: [5, 8], g: [11, 2], b: [1, 7],
                y: [8, 3], t: [5, 2],  v: [2, 3] }
hash_homes  = { r: [5, 8], g: [11, 3], b: [8, 3] }

map_arr = fill_map
map_arr[6][6] = 1

blocks = hash_blocks.to_json
homes  = hash_homes.to_json
map    = map_arr.to_json

Level.create(blocks: blocks, homes: homes, map: map, level_type: 'basic')
