# 1

# a = 'a'
# b = 'b'
# c = 'b'
# d = 'c'

# p(a <=> b)
# p(c <=> b)
# p(d <=> c)

# array = [a, b, c, d]
# p array[0].object_id
# p array[1].object_id
# p array[2].object_id
# p array[3].object_id

# puts '-----'

# new_array = array.sort
# p new_array[0].object_id
# p new_array[1].object_id
# p new_array[2].object_id
# p new_array[3].object_id



# 3

# arr = [
#         {
#           one: '1',
#           two: 2
#         },
#         [
#           {
#             four: 5,
#             three: 6
#           },
#           :three
#         ],
#         :three,
#         {
#           2=>:two,
#           3=>:three
#         }
#         ]

# p arr[1][0][:three]
# p arr[1][1]
# p arr[2]
# p arr[3][3]



# # 4

# todo_lists =  [
#                 {
#                   id: 1,
#                   list_name: 'Groceries',
#                   todos: [
#                     { id: 1, name: 'Bread', completed: false },
#                     { id: 2, name: 'Milk', completed: false },
#                     { id: 3, name: 'Apple Juice', completed: false }
#                   ]
#                 }
#               ]

# todo_lists[0][:todos][2][:name] = 'Orange Juice'
# p todo_lists



# 5

# todo_lists = [
#   {
#     id: 1,
#     list_name: 'Groceries',
#     todos: [
#       { id: 1, name: 'Bread', completed: false },
#       { id: 2, name: 'Milk', completed: false },
#       { id: 3, name: 'Apple Juice', completed: false }
#     ]
#   },
#   {
#     id: 2,
#     list_name: 'Homework',
#     todos: [
#       { id: 1, name: 'Math', completed: false },
#       { id: 2, name: 'English', completed: false }
#     ]
#   }
# ]

# todo_lists[1][:todos].each do |todo|
#   todo[:completed] = true
# end

# pp todo_lists


# 6


# a = 'hi'

# english_greetings = ['hello', 'hi', 'good morning']

# greetings = {
#   french: ['bonjour', 'salut', 'allo'],
#   english: ['hello', 'hi', 'good morning'],
#   italian: ['buongiorno', 'buonasera', 'ciao']
# }


# english_greetings = ['hello', 'hey', 'good morning']

# greetings = {
#   french: ['bonjour', 'salut', 'allo'],
#   english: ['hello', 'hey', 'good morning'],
#   italian: ['buongiorno', 'buonasera', 'ciao']
# }


# greetings = {
#   french: ['BONJOUR', 'SALUT', 'ALLO'],
#   english: ['HELLO', 'HEY', 'GOOD MORNING'],
#   italian: ['BUONGIORNO', 'BUONASERA', 'CIAO']
# }

# english_greetings = ['HELLO', 'HEY', 'GOOD MORNING']

# a = 'hi'
# english_greetings[1] = 'HEY'
# greetings[:english][1] = 'HEY'



# 7

# [['a', 'b'], ['c', 'd'], ['e', 'f']].map do |sub_arr|
#   sub_arr.map do |letter|
#     letter.upcase                                       # A B C D E F
#   end                                                   # => ['A', 'B'], ['C', 'D'], ['E', 'F']
# end                                                     # => [['A', 'B'], ['C', 'D'], ['E', 'F']]



# # 8 - 10

# order_data = [
#   { customer_id: 12, customer_name: 'Emma Lopez', order_id: 351, order_date: '12/04/16', order_fulfilled: true, order_value: 135.99 },
#   { customer_id: 12, customer_name: 'Emma Lopez', order_id: 383, order_date: '12/04/16', order_fulfilled: true, order_value: 289.49 },
#   { customer_id: 12, customer_name: 'Emma Lopez', order_id: 392, order_date: '01/10/17', order_fulfilled: false, order_value: 58.00 },
#   { customer_id: 32, customer_name: 'Michael Richards', order_id: 241, order_date: '11/10/16', order_fulfilled: true, order_value: 120.00 },
#   { customer_id: 32, customer_name: 'Michael Richards', order_id: 395, order_date: '01/10/17', order_fulfilled: false, order_value: 85.65 },
#   # rest of data...
# ]


# {
#   customer_id: 12,
#   customer_name: 'Emma Lopez',
#   orders: [
#     { order_fulfilled: true, order_value: 135.99 },
#     { order_fulfilled: true, order_value: 289.49 },
#     { order_fulfilled: false, order_value: 58.00 }
#   ]
# }


# row = { customer_id: 12, customer_name: 'Emma Lopez', order_id: 351, order_date: '12/04/16', order_fulfilled: true, order_value: 135.99 }


# a

# customer_orders = { 12 => {
#   customer_id: 12,
#   customer_name: 'Emma Lopez',
#   orders: [
#     [ true, 135.99 ],
#     [ true, 289.49 ]
#   ]
# }

# customer_orders = [
#   {
#     customer_id: 12,
#     customer_name: 'Emma Lopez',
#     orders: [
#       [ true, 135.99 ],
#       [ true, 289.49 ]
#     ]
#   }
# ]

# doesn't hold orders in a hash


# b

# temp_orders = {
#   12 = {
#     customer_name: 'Emma Lopez',
#     customer_id: 12
#     orders: [
#       { order_fulfilled: true, order_value: 135.99 }
#     ]
#   }
# }

# temp_orders = {
#   12 = {
#     customer_name: 'Emma Lopez',
#     customer_id: 12
#     orders: [
#       { order_fulfilled: true, order_value: 289.49 }
#     ]
#   }
# }

# replaces temp_orders on each iteration with the current iteration order values


# c

# customer_orders = { 12 => {
#   customer_id: 12,
#   customer_name: 'Emma Lopez',
#   orders: [
#     { order_fulfilled: true, order_value: 135.99 }
#   ]
# }

# customer_orders = { 12 => {
#   customer_id: 12,
#   customer_name: 'Emma Lopez',
#   orders: [
#     { order_fulfilled: true, order_value: 135.99 },
#     { order_fulfilled: true, order_value: 289.49 }
#   ]
# }

# customer_orders = [
#   {
#     customer_id: 12,
#     customer_name: 'Emma Lopez',
#     orders: [
#       { order_fulfilled: true, order_value: 135.99 },
#       { order_fulfilled: true, order_value: 289.49 }
#     ]
#   }
# ]

# yes


# d

# transforms to the correct form, but doesn't add orders for existing key, each order is still a row



# 9

# customer_orders = [
#   {
#     customer_id: 12,
#     customer_name: 'Emma Lopez',
#     orders: [
#       { order_fulfilled: true, order_value: 135.99 },
#       { order_fulfilled: true, order_value: 289.49 },
#       { order_fulfilled: false, order_value: 58.00 }
#     ]
#   },
#   {
#     customer_id: 32,
#     customer_name: 'Michael Richards',
#     orders: [
#       { order_fulfilled: true, order_value: 120.00 },
#       { order_fulfilled: false, order_value: 85.65 }
#     ]
#   },
# ]

# # target
# all_orders =[
#   {customer_id: 12, customer_name: 'Emma Lopez', total_order_value: 483.48},
#   {customer_id: 32, customer_name: 'Michael Richards', total_order_value: 205.65},
# ]


# a - YES


# all_orders = customer_orders.map do |customer|
#   {
#     customer_id: customer[:customer_id],
#     customer_name: customer[:customer_name]
#   }
# end
# =>  [
#       {
#         customer_id: 12,
#         customer_name: 'Emma Lopez'
#       },
#       {
#         customer_id: 32,
#         customer_name: 'Michael Richards'
#       },
#     ]



# customer_orders.each_with_index do |data, index|
#   order_value = data[:orders].reduce(0) do |total, order|
#     total + order[:order_value]
#   end

#   all_orders[index][:total_order_value] = order_value
# end


#     orders: [
#       { order_fulfilled: true, order_value: 135.99 },
#       { order_fulfilled: true, order_value: 289.49 },
#       { order_fulfilled: false, order_value: 58.00 }
#     ].reduce(0) do |total, order|
#       total + 135.99 then 289.49 then 58
#     end
#     order_value = 483.48

#       {
#         customer_id: 12,
#         customer_name: 'Emma Lopez',
#         total_order_value: 483.48
#       }


# b YES

# all_orders = customer_orders.map do |customer_data|
#   order_value = customer_data[:orders].inject(0) do |total, order_data|
#     total + order_data[:order_value]
#   end

#   {
#     customer_id: customer_data[:customer_id],
#     customer_name: customer_data[:customer_name],
#     total_order_value: order_value
#   }
# end



# {
#     customer_id: 12,
#     customer_name: 'Emma Lopez',
#     orders: [
#       { order_fulfilled: true, order_value: 135.99 },
#       { order_fulfilled: true, order_value: 289.49 },
#       { order_fulfilled: false, order_value: 58.00 }
#     ]
#   }.map

#   orders: [
#       { order_fulfilled: true, order_value: 135.99 },
#       { order_fulfilled: true, order_value: 289.49 },
#       { order_fulfilled: false, order_value: 58.00 }
#     ].inject(0) do |total, order_data|
#       total + order_value:
#     end

#     {
#       customer_id: 12,
#       customer_name: 'Emma Lopez',
#       total_order_value: order_value
#     }


# c YES
# all_orders = []

# customer_orders.each do |customer_data|
#   customer_total_orders = {
#     customer_id: customer_data[:customer_id],
#     customer_name: customer_data[:customer_name],
#     total_order_value: 0
#   }


# customer_data = {
#                   customer_id: 12,
#                   customer_name: 'Emma Lopez',
#                   orders: [
#                     { order_fulfilled: true, order_value: 135.99 },
#                     { order_fulfilled: true, order_value: 289.49 },
#                     { order_fulfilled: false, order_value: 58.00 }
#                   ]
#                 }

# customer_total_orders = {
#   customer_id: 12,
#   customer_name: 'Emma Lopez',
#   total_order_value = 0
# }


# { order_fulfilled: true, order_value: 135.99 },
# { order_fulfilled: true, order_value: 289.49 },
# { order_fulfilled: false, order_value: 58.00 }

#   customer_data[:orders].each do |order|
#     customer_total_orders[:total_order_value] += order[:order_value]
#   end

#   all_orders << customer_total_orders
# end


# d NO, returns nested arrays.

# all_orders = []

# customer_orders.each do |customer_data|
#   cust_arr = [
#     [:customer_id, customer_data[:customer_id]],
#     [:customer_name, customer_data[:customer_name]],
#     [:total_order_value]
#   ]

# customer_data = {
#     customer_id: 12,
#     customer_name: 'Emma Lopez',
#     orders: [
#       { order_fulfilled: true, order_value: 135.99 },
#       { order_fulfilled: true, order_value: 289.49 },
#       { order_fulfilled: false, order_value: 58.00 }
#     ]
#   }

#   cust_arr =  [
#                 [:customer_id, 12],
#                 [:customer_name, 'Emma Lopez'],
#                 [:total_order_value]
#               ]


#   order_value = 0
#   customer_data[:orders].each do |order|
#     order_value += order[:order_value]
#   end

# [
#   { order_fulfilled: true, order_value: 135.99 },
#   { order_fulfilled: true, order_value: 289.49 },
#   { order_fulfilled: false, order_value: 58.00 }
# ].each

# order = { order_fulfilled: true, order_value: 135.99 },

# order_value += 135.99 etc.

#   cust_arr[2] << order_value

# cust_arr =  [
#               [:customer_id, 12],
#               [:customer_name, 'Emma Lopez'],
#               [:total_order_value, order_value]
#             ]

#   all_orders << cust_arr
# end


# 10

# customer_orders = [
#   {
#     customer_id: 12,
#     customer_name: 'Emma Lopez',
#     orders: [
#       { order_fulfilled: true, order_value: 135.99 },
#       { order_fulfilled: true, order_value: 289.49 },
#       { order_fulfilled: false, order_value: 58.00 }
#     ]
#   },
#   {
#     customer_id: 32,
#     customer_name: 'Michael Richards',
#     orders: [
#       { order_fulfilled: true, order_value: 120.00 },
#       { order_fulfilled: false, order_value: 85.65 }
#     ]
#   },
# ]

# # target
# fulfilled_orders =[
#   {customer_id: 12, customer_name: 'Emma Lopez', order_value: 425.48},
#   {customer_id: 32, customer_name: 'Michael Richards', order_value: 120.00},
#   # rest of data
# ]

# fulfilled_orders = customer_orders.map do |customer|
#   {
#     customer_id: customer[:customer_id],
#     customer_name: customer[:customer_name]
#   }
# end

# # customer = {
# #     customer_id: 12,
# #     customer_name: 'Emma Lopez',
# #     orders: [
# #       { order_fulfilled: true, order_value: 135.99 },
# #       { order_fulfilled: true, order_value: 289.49 },
# #       { order_fulfilled: false, order_value: 58.00 }
# #     ]
# #   }

# fulfilled_orders = [
#   {
#     customer_id: 12,
#     customer_name: 'Emma Lopez'
#   }
#   # ...
# ]


# customer_orders.each_with_index do |data, index|
#   order_value = data[:orders].reduce(0) do |total, order|
#     total + order[:order_value] if order[:order_fulfilled]
#   end

#   fulfilled_orders[index][:order_value] = order_value
# end

# # data = {
# #     customer_id: 12,
# #     customer_name: 'Emma Lopez',
# #     orders: [
# #       { order_fulfilled: true, order_value: 135.99 },
# #       { order_fulfilled: true, order_value: 289.49 },
# #       { order_fulfilled: false, order_value: 58.00 }
# #     ]
# #   }

# # index = 0

# order_value = orders: [
#                         { order_fulfilled: true, order_value: 135.99 },
#                         { order_fulfilled: true, order_value: 289.49 },
#                         { order_fulfilled: false, order_value: 58.00 }
#                       ].reduce(0) do |total, order|
#                           total + 135.99 if true
#                         end

# fulfilled_orders[0][:order_value] = order_value


# customer_orders = [
#   {
#     customer_id: 12,
#     customer_name: 'Emma Lopez',
#     orders: [
#       { order_fulfilled: true, order_value: 135.99 },
#       { order_fulfilled: true, order_value: 289.49 },
#       { order_fulfilled: false, order_value: 58.00 }
#     ]
#   },
#   {
#     customer_id: 32,
#     customer_name: 'Michael Richards',
#     orders: [
#       { order_fulfilled: true, order_value: 120.00 },
#       { order_fulfilled: false, order_value: 85.65 }
#     ]
#   }
# ]

# fulfilled_orders = customer_orders.map do |customer|
#   {
#     customer_id: customer[:customer_id],
#     customer_name: customer[:customer_name]
#   }
# end

# customer_orders.each_with_index do |data, index|
#   order_value = data[:orders].reduce(0) do |total, order|
#     total + order[:order_value] if order[:order_fulfilled]
#   end

#   fulfilled_orders[index][:order_value] = order_value
# end

# pp fulfilled_orders


# # corrected

# fulfilled_orders = customer_orders.map do |customer|
#   {
#     customer_id: customer[:customer_id],
#     customer_name: customer[:customer_name]
#   }
# end

# customer_orders.each_with_index do |data, index|
#   order_value = data[:orders].reduce(0) do |total, order|
#     if order[:order_fulfilled]                              # corrected if statement
#       total + order[:order_value]
#     else
#       total
#     end
#   end

#   fulfilled_orders[index][:order_value] = order_value
# end

# pp fulfilled_orders