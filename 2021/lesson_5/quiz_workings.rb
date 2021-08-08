# 2.

# [a, b, c, d]

# a b c d
# or
# a c b d

# 3.

arr = [
        {one: '1', two: 2},
        [{four: 5, three: 6}, :three],
        :three,
        {2=>:two, 3=>:three}
      ]

# 4

todo_lists =  [
                {
                  id: 1,
                  list_name: 'Groceries',
                  todos: [
                    { id: 1, name: 'Bread', completed: false },
                    { id: 2, name: 'Milk', completed: false },
                    { id: 3, name: 'Apple Juice', completed: false }
                  ]
                }
              ]

todo_lists[0][:todos][2][:name] = 'Orange Juice'
pp todo_lists


puts '---'

# 5

todo_lists = [
  {
    id: 1,
    list_name: 'Groceries',
    todos: [
      { id: 1, name: 'Bread', completed: false },
      { id: 2, name: 'Milk', completed: false },
      { id: 3, name: 'Apple Juice', completed: false }
    ]
  },
  {
    id: 2,
    list_name: 'Homework',
    todos: [
      { id: 1, name: 'Math', completed: false },
      { id: 2, name: 'English', completed: false }
    ]
  }
]

# todo_lists[1][:todos].each do |hash|
#   hash[:completed] = true
# end

# todo_lists[1].each do |list_key, list_value|
#   if list_key == :todos
#     list_value.each { |todo| todo[:completed] = true }
#   end
# end

# todo_lists[1][:todos][0][:completed] = true
# todo_lists[1][:todos][1][:completed] = true

todo_lists.each do |list|
  if list[:list_name] == 'Homework'
    list[:todos].each do |todo|
      todo[:completed] = true
    end
  end
end

pp todo_lists


puts '----'

# 6.

a = 'hi'
english_greetings = ['hello', a, 'good morning']

greetings = {
  french: ['bonjour', 'salut', 'allo'],
  english: english_greetings,
  italian: ['buongiorno', 'buonasera', 'ciao']
}

greetings[:english][1] = 'hey'

# => ['hello', 'hey', 'good morning']
# =>  {
#       french: ['bonjour', 'salut', 'allo'],
#       english: ['hello', 'hey', 'good morning']
#       italian: ['buongiorno', 'buonasera', 'ciao']
#     }

greetings.each do |language, greeting_list|
  greeting_list.each { |greeting| greeting.upcase! }
end

# => ['HELLO', 'HEY', 'GOOD MORNING']
# =>  {
#       french: ['BONJOUR', 'SALUT', 'ALLO'],
#       english: ['HELLO', 'HEY', 'GOOD MORNING']
#       italian: ['BUONGIORNO', 'BUONASERA', 'CIAO']
#     }

puts a                        # => 'hi'
puts english_greetings[1]     # => 'HEY'
puts greetings[:english][1]   # => 'HEY'

puts '---'

# 7.

[['a', 'b'], ['c', 'd'], ['e', 'f']].map do |sub_arr|
  sub_arr.map do |letter|
    letter.upcase
  end
end

# new array => [['A', 'B'], ['C', 'D'], ['E', 'F']]


puts '---'

# 8.

order_data = [
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 351, order_date: '12/04/16', order_fulfilled: true, order_value: 135.99},
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 383, order_date: '12/04/16', order_fulfilled: true, order_value: 289.49},
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 392, order_date: '01/10/17', order_fulfilled: false, order_value: 58.00},
  {customer_id: 32, customer_name: 'Michael Richards', order_id: 241, order_date: '11/10/16', order_fulfilled: true, order_value: 120.00},
  {customer_id: 32, customer_name: 'Michael Richards', order_id: 395, order_date: '01/10/17', order_fulfilled: false, order_value: 85.65},
  # rest of data...
]


# Restructured data should look like this:

customer_orders = [
  {
    customer_id: 12,
    customer_name: 'Emma Lopez',
    orders: [
      { order_fulfilled: true, order_value: 135.99 },
      { order_fulfilled: true, order_value: 289.49 },
      { order_fulfilled: false, order_value: 58.00 }
    ]
  },
  {
    customer_id: 32,
    customer_name: 'Michael Richards',
    orders: [
      { order_fulfilled: true, order_value: 120.00 },
      { order_fulfilled: false, order_value: 85.65 }
    ]
  },
  # rest of data...
]

# A)

# 12 = {
#   customer_id: 12,
#   customer_name: 'Emma Lopez',
#   orders: [
#     [
#       true,
#       135.99
#     ]
#   ]
# }

# False, :orders value is an array not hash and doesn't contain keys.

# B)

# {
#   12 =  {
#           customer_id: 12,
#           customer_name: 'Emma Lopez',
#           orders: [
#                     {
#                       order_fulfilled: true,
#                       order_value: 135.99
#                     }
#                   ]
#         }
# }

# False, key values get overwritten

# C)

{
  12 => {
          customer_id: 12,
          customer_name: 'Emma Lopez',
          orders: [
                    { order_fulfilled: true, order_value: 135.99 },
                    { order_fulfilled: true, order_value: 289.49 }
                  ]
        },
  32 => {
          customer_id: 32,
          customer_name: 'Michael Richards',
          orders: [
                    { order_fulfilled: true, order_value: 120.00 },
                    { order_fulfilled: false, order_value: 85.65 }
                  ]
        }
}

# True

# D)

# False, will return an array with the same number of elements as the order_data array


puts '----'

# 9.

customer_orders = [
  {
    customer_id: 12,
    customer_name: 'Emma Lopez',
    orders: [
      { order_fulfilled: true, order_value: 135.99 },
      { order_fulfilled: true, order_value: 289.49 },
      { order_fulfilled: false, order_value: 58.00 }
    ]
  },
  {
    customer_id: 32,
    customer_name: 'Michael Richards',
    orders: [
      { order_fulfilled: true, order_value: 120.00 },
      { order_fulfilled: false, order_value: 85.65 }
    ]
  },
  # rest of data...
]

all_orders =[
  { customer_id: 12, customer_name: 'Emma Lopez', total_order_value: 483.48 },
  { customer_id: 32, customer_name: 'Michael Richards', total_order_value: 205.65 },
  # rest of data
]

fulfilled_orders =[
  { customer_id: 12, customer_name: 'Emma Lopez', order_value: 425.48 },
  { customer_id: 32, customer_name: 'Michael Richards', order_value: 120.00 },
  # rest of data
]

# A)

all_orders = [
  { customer_id: 12, customer_name: 'Emma Lopez', total_order_value: 483.48 },
  { customer_id: 32, customer_name: 'Michael Richards', total_order_value: 205.65 },
]

# True


# B)

# True

# C)

# True

# D)

# False, returns array of arrays

puts '---'

# 10.


fulfilled_orders = customer_orders.map do |customer|
  {
    customer_id: customer[:customer_id],
    customer_name: customer[:customer_name]
  }
end

customer_orders.each_with_index do |data, index|
  order_value = data[:orders].reduce(0) do |total, order|
    total + order[:order_value] if order[:order_fulfilled]
  end

  fulfilled_orders[index][:order_value] = order_value
end


# should be:

customer_orders.each_with_index do |data, index|
  order_value = data[:orders].reduce(0) do |total, order|
    order[:order_fulfilled] ? total + order[:order_value] : total
  end

  fulfilled_orders[index][:order_value] = order_value
end

