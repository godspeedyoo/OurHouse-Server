# HOUSES
house1 = House.create(name: "devbootcamp")
house2 = House.create(name: "hackreactor")

# USERS
charles = User.create(name: "charles", house_id: house1.id)
brian = User.create(name: "brian", house_id: house1.id)
ali = User.create(name: "ali", house_id: house1.id)
anthony = User.create(name: "anthony", house_id: house1.id)
joe = User.create(name: "joseph", house_id: house1.id)
ass = User.create(name: "Asshole", house_id: house2.id)

# MESSAGES
Task.create(user_id: charles.id, content: "clean shit up")
Task.create(user_id: charles.id, content: "cook food")

Activity.create(user_id: brian.id, content: "Come eat dinner with me at Chipotle!")
Notif.create(user_id: brian.id, content: "My asshole friend is going to sleep on the couch, hope that's cool!")

# PAYMENTS
charles.payments.create(amount: 1, description: "rent for dbc", fulfilled: 1, house_id: 1, payer_id: charles.id, receiver_id: joe.id)
joe.payments.create(amount: 10, description: "paying back borrowed cash", fulfilled: 1, house_id: 1, payer_id: joe.id, receiver_id: charles.id)
