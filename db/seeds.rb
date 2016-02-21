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
        arr[i][k] = 'wl'
      else
        arr[i][k] = 'sq'
      end
    end
  end
  arr
end

def make_level(hash_blocks, hash_homes, map_arr, type)
  blocks = hash_blocks.to_json
  homes  = hash_homes.to_json
  map    = map_arr.to_json
  Level.create(blocks: blocks, homes: homes, map: map, level_type: type)
end

#level 1
hash_blocks = { r: [6, 1], g: [6, 11] }
hash_homes = { r: [6, 8], g: [6, 4] }
map_arr = [["wl", "wl", "wl", "wl", "wl", "wl", "wl", "wl", "wl", "wl", "wl", "wl", "wl"], ["wl", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "wl"],["wl", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "wl"],["wl", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "wl"],["wl", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "wl"],["wl", "wl", "wl", "wl", "wl", "wl", "wl", "wl", "wl", "wl", "wl", "wl", "wl"],["wl", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "wl"],["wl", "wl", "wl", "wl", "wl", "wl", "sq", "wl", "wl", "wl", "wl", "wl", "wl"],["wl", "sq", "sq", "sq", "sq", "sq", "wl", "sq", "sq", "sq", "sq", "sq", "wl"],["wl", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "wl"],["wl", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "wl"],["wl", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "sq", "wl"],["wl", "wl", "wl", "wl", "wl", "wl", "wl", "wl", "wl", "wl", "wl", "wl", "wl"]]
type = 'Novice'

make_level(hash_blocks, hash_homes, map_arr, type)

#level 2
hash_blocks = {"r":[5,6],"g":[7,6]}
hash_homes = {"r":[6,2],"g":[6,10]}
map_arr = [["wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","sq","sq","wl","wl","wl","sq","wl","wl","wl","sq","sq","wl"],["wl","sq","wl","sq","sq","sq","wl","sq","sq","sq","wl","sq","wl"],["wl","wl","sq","sq","wl","sq","sq","sq","wl","sq","sq","wl","wl"],["wl","wl","sq","wl","sq","wl","sq","wl","sq","wl","sq","wl","wl"],["wl","wl","sq","sq","wl","sq","sq","sq","wl","sq","sq","wl","wl"],["wl","sq","wl","sq","sq","sq","wl","sq","sq","sq","wl","sq","wl"],["wl","sq","sq","wl","wl","wl","sq","wl","wl","wl","sq","sq","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl"]]
type = 'Novice'

make_level(hash_blocks, hash_homes, map_arr, type)

#level 3
hash_blocks = {"v":[1,1],"t":[1,2],"y":[1,3],"r":[1,6],"g":[1,5],"b":[1,4]}
hash_homes = {"r":[11,6],"g":[11,7],"b":[11,8],"v":[11,10],"y":[11,9],"t":[11,11]}
map_arr = [["wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","sq","sq","sq","sq","sq","wl","sq","sq","sq","sq","sq","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl"]]
type = 'Novice'

make_level(hash_blocks, hash_homes, map_arr, type)

#level 4
hash_blocks = {"v":[5,7],"r":[6,5],"y":[7,5],"g":[7,6],"t":[7,7],"b":[6,7]}
hash_homes = {"v":[6,1],"b":[5,1],"t":[4,1],"g":[3,1],"y":[2,1],"r":[1,1]}
map_arr = [["wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl"],["wl","sq","wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","sq","wl","sq","wl","wl","wl","wl","wl","wl","wl","sq","wl"],["wl","sq","wl","sq","wl","sq","sq","sq","sq","sq","wl","sq","wl"],["wl","sq","wl","sq","wl","sq","wl","wl","wl","sq","wl","sq","wl"],["wl","sq","wl","sq","wl","sq","wl","sq","wl","sq","wl","sq","wl"],["wl","sq","wl","sq","wl","sq","wl","sq","wl","sq","wl","sq","wl"],["wl","sq","wl","sq","wl","sq","sq","sq","wl","sq","wl","sq","wl"],["wl","sq","wl","sq","wl","wl","wl","wl","wl","sq","wl","sq","wl"],["wl","sq","wl","sq","sq","sq","sq","sq","sq","sq","wl","sq","wl"],["wl","sq","wl","wl","wl","wl","wl","wl","wl","wl","wl","sq","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl"]]
type = 'Novice'

make_level(hash_blocks, hash_homes, map_arr, type)

#level 5
hash_blocks = {"r":[5,2],"g":[5,10]}
hash_homes = {"r":[6,1],"g":[6,11]}
map_arr = [["wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl","wl"],["wl","sq","wl","sq","sq","sq","sq","sq","sq","sq","wl","sq","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl"]]
type = 'Novice'

make_level(hash_blocks, hash_homes, map_arr, type)

#level 6
hash_blocks = {"r":[4,9],"g":[5,8],"b":[6,7],"y":[7,6],"t":[8,5],"v":[9,4]}
hash_homes = {"v":[8,3],"t":[7,4],"y":[6,5],"b":[5,6],"g":[4,7],"r":[3,8]}
map_arr = [["wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","sq","wl","sq","sq","sq","sq","sq","sq","sq","wl","sq","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","wl","sq","sq","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","wl","sq","sq","sq","wl"],["wl","sq","sq","sq","sq","sq","sq","wl","sq","sq","sq","sq","wl"],["wl","sq","sq","sq","sq","sq","wl","sq","sq","sq","sq","sq","wl"],["wl","sq","sq","sq","sq","wl","sq","sq","sq","sq","sq","sq","wl"],["wl","sq","sq","sq","wl","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","sq","sq","wl","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","sq","wl","sq","sq","sq","sq","sq","sq","sq","wl","sq","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl"]]
type = 'Novice'

make_level(hash_blocks, hash_homes, map_arr, type)

#level 7
hash_blocks = {"y":[5,6],"b":[6,7],"r":[7,6],"g":[6,5]}
hash_homes = {"y":[7,7],"b":[7,5],"r":[5,5],"g":[5,7]}
map_arr = [["wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","sq","sq","sq","sq","sq","wl","sq","sq","sq","sq","sq","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl"]]
type = 'Novice'

make_level(hash_blocks, hash_homes, map_arr, type)

#level 8
hash_blocks = {"t":[9,8],"v":[9,4],"r":[1,1],"b":[3,1],"y":[4,1],"g":[2,1]}
hash_homes = {"t":[1,3],"v":[1,9],"r":[1,11],"b":[3,11],"y":[4,11],"g":[2,11]}
map_arr = [["wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl"],["wl","sq","wl","sq","wl","sq","sq","sq","wl","sq","wl","sq","wl"],["wl","sq","wl","sq","sq","sq","sq","sq","sq","sq","wl","sq","wl"],["wl","sq","wl","sq","sq","sq","sq","sq","sq","sq","wl","sq","wl"],["wl","sq","wl","sq","sq","sq","sq","sq","sq","sq","wl","sq","wl"],["wl","sq","wl","sq","sq","sq","sq","sq","sq","sq","wl","sq","wl"],["wl","sq","wl","sq","sq","sq","sq","sq","sq","sq","wl","sq","wl"],["wl","sq","wl","sq","sq","sq","sq","sq","sq","sq","wl","sq","wl"],["wl","sq","wl","sq","sq","sq","sq","sq","sq","sq","wl","sq","wl"],["wl","sq","sq","wl","sq","sq","sq","sq","sq","wl","sq","sq","wl"],["wl","sq","sq","sq","wl","wl","wl","wl","wl","sq","sq","sq","wl"],["wl","sq","wl","sq","sq","sq","sq","sq","sq","sq","wl","sq","wl"],["wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl"]]
type = 'Novice'

make_level(hash_blocks, hash_homes, map_arr, type)

#level 100
hash_blocks = {"g":[4,4],"v":[7,7],"r":[7,9],"b":[5,5],"y":[5,6],"t":[6,6]}
hash_homes = {"g":[10,9],"v":[2,6],"r":[10,2],"b":[9,10],"y":[9,3],"t":[5,9]}
map_arr = [["wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","sq","sq","wl","sq","sq","sq","wl","wl","sq","sq","sq","wl"],["wl","sq","sq","wl","sq","sq","wl","sq","sq","wl","sq","sq","wl"],["wl","sq","sq","wl","sq","sq","wl","sq","sq","wl","sq","sq","wl"],["wl","sq","sq","wl","wl","sq","sq","wl","wl","sq","sq","sq","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","sq","sq","wl","wl","sq","wl","sq","wl","sq","wl","sq","wl"],["wl","sq","wl","sq","sq","sq","sq","sq","sq","wl","sq","sq","wl"],["wl","sq","wl","sq","wl","sq","wl","sq","sq","wl","sq","sq","wl"],["wl","sq","sq","wl","wl","sq","wl","sq","wl","sq","wl","sq","wl"],["wl","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","sq","wl"],["wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl","wl"]]
type = 'Professional'

make_level(hash_blocks, hash_homes, map_arr, type)
