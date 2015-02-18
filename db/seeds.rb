# HOUSES
house1 = House.create(name: "devbootcamp")
house2 = House.create(name: "hackreactor")

# USERS
charles = User.create(:name => "Charles Kim",
			         :first_name => "Charles",
			           :nickname => nil,
			              :image => "https://lh5.googleusercontent.com/-onTrY2f-UPc/AAAAAAAAAAI/AAAAAAAAADU/V72OQznS-go/photo.jpg",
			              :email => "ckim0706@gmail.com",
			           :house_id => 1,
			          :google_id => "google-oauth2|117888160479464920985")

brian = User.create(:name => "Brian Vogelgesang",
			         :first_name => "Brian",
			           :nickname => nil,
			              :image => "https://lh6.googleusercontent.com/-HnwngPrmnwg/AAAAAAAAAAI/AAAAAAAAEBc/eK_JEkkF8PU/photo.jpg",
			              :email => "kida001@gmail.com",
			           :house_id => nil,
			          :google_id => "google-oauth2|104680379455852455932")
ali = User.create(:name => "Ali Esmaili",
			         :first_name => "Ali",
			           :nickname => nil,
			              :image => "https://lh3.googleusercontent.com/-EwkjV1gdYnk/AAAAAAAAAAI/AAAAAAAAAEs/N_jM2y4vCXw/photo.jpg",
			              :email => "aesm85@gmail.com",
			           :house_id => nil,
			          :google_id => "google-oauth2|114450075152952346410")
anthony = User.create(:name => "Anthony Ng",
			         :first_name => "Anthony",
			           :nickname => nil,
			              :image => "https://lh3.googleusercontent.com/-3E5T4djZ-B8/AAAAAAAAAAI/AAAAAAAAExM/EncyPtQeqwE/photo.jpg",
			              :email => "thomsonng123@gmail.com",
			           :house_id => nil,
			          :google_id => "google-oauth2|108332082842240098504")


joe = User.create(:name => "Joseph Won",
		         :first_name => "Joseph",
		           :nickname => nil,
		              :image => "https://lh4.googleusercontent.com/-J29T9HpmO9U/AAAAAAAAAAI/AAAAAAAAAz0/mz0jo6jF3yI/photo.jpg",
		              :email => "godspeedyoo@gmail.com",
		           :house_id => nil,
		          :google_id => "google-oauth2|102015291212688963375")

ass = User.create(name: "Asshole", house_id: house2.id)

# MESSAGES
Task.create(user_id: charles.id, content: "clean shit up")
Task.create(user_id: charles.id, content: "cook food")

Activity.create(user_id: brian.id, content: "Come eat dinner with me at Chipotle!")
Notif.create(user_id: brian.id, content: "My asshole friend is going to sleep on the couch, hope that's cool!")

# PAYMENTS
charles.payments.create(amount: 1, description: "rent for dbc", fulfilled: true, house_id: 1, payer_id: charles.id, receiver_id: joe.id)
joe.payments.create(amount: 10, description: "paying back borrowed cash", fulfilled: true, house_id: 1, payer_id: joe.id, receiver_id: charles.id)
