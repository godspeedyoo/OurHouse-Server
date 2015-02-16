# USERS
charles = User.create(name: "charles", password: "12341234", uid: 1234, provider: "google", house_id: 1)
joe = User.create(name: "joseph", password: "12341234", uid: 2345, provider: "google", house_id: 1)

# HOUSES
House.create(name: "devbootcamp")
House.create(name: "hackreactor")

# MESSAGES
Message.create(user_id: 1, message_type: "chores", content: "clean up")
Message.create(user_id: 1, message_type: "task", content: "cook food")

Message.create(user_id: 2, message_type: "chores", content: "pick up trash")
Message.create(user_id: 2, message_type: "task", content: "pick up laundry")

# PAYMENTS
## Charles is making a payment to joe for dbc rent
charles.payments.create(amount: 1, description: "rent for dbc", fulfilled: 1, house_id:1, payer_id: charles.id, receiver_id: joe.id)
## Charles is requesting payment for food from Joe
charles.payments.create(amount: 5, description: "requesting payment for food bills", fulfilled: 0, house_id:1, payer_id: joe.id, receiver_id: charles.id)
## Joe is making a payment to charles
joe.payments.create(amount: 10, description: "paying back borrowed cash", fulfilled: 1, house_id:1, payer_id: joe.id, receiver_id: charles.id)
# joe.payments.create(amount: 15, description: "at&t cable bills", fulfilled: 0, house_id:1)

# MESSAGES_USERS
MessagesUser.create(message_id: 1, user_id: 1, read: true)
MessagesUser.create(message_id: 2, user_id: 1, read: false)
