# Our House Server - API

**Rails version 4.2.0**

## User
### Get Users
**get /users**
```
    [{
    id: 1,
    name: "charles",
    nickname: null,
    image: null,
    email: null,
    house_id: 1,
    created_at: "2015-02-16T03:05:00.300Z",
    updated_at: "2015-02-16T03:05:00.300Z"
    },
    {
    id: 2,
    name: "brian",
    nickname: null,
    image: null,
    email: null,
    house_id: 1,
    created_at: "2015-02-16T03:05:00.303Z",
    updated_at: "2015-02-16T03:05:00.303Z"
    }]
```
   

***
HOUSE
***


* create new house
    'post' users/:id/house
    - data structure
    	-

* Show house
    'get' users/:id/houses/:house_id
    - return data
    	-

* Invite housemate
    There is button, if clicked, send email with unique code
    custom route to generate unique code
    - return data
    	-

***
MESSAGE
***

* Show all message/task
    'get' users/:user_id/houses/:house_id/messages
    - return data
        - [
            {
            id: 4,
            user_id: 1,
            house_id: 1,
            message_type: null,
            content: "hi",
            created_at: "2015-02-15T02:59:46.105Z",
            updated_at: "2015-02-15T02:59:46.105Z"
            },
            {
            id: 5,
            user_id: 1,
            house_id: 1,
            message_type: null,
            content: "heyyy",
            created_at: "2015-02-15T03:00:22.178Z",
            updated_at: "2015-02-15T03:00:22.178Z"
            }
          ]

* Create new message/task
    params[:type] // chores, task, notification
    'post' /users/:user_id/houses/:house_id/messages
    - expecting data in this format
    	- {
              message:
                {
                  message_type: "chore",
                  content: "do the dishes"
                }
            }
    - return data
        - {
            id: 4,
            user_id: 1,
            house_id: 1,
            message_type: null,
            content: "hi",
            created_at: "2015-02-15T02:59:46.105Z",
            updated_at: "2015-02-15T02:59:46.105Z"
        }
    - return data if it fails
        - { message: 'Message not created' }, status: 403


* Show message/task
    'get' users/:id/houses/:house_id/messages
    - return data
    	- [
            {
            id: 5,
            user_id: 1,
            house_id: 1,
            message_type: null,
            content: "heyyy",
            created_at: "2015-02-15T03:00:22.178Z",
            updated_at: "2015-02-15T03:00:22.178Z"
            }
          ]

* Edit message/task
    params[:status] status defaults to "unread" //status will be "read", "delete" <-- User has deleted it from their view
    'put' users/:id/houses/:house_id/message/:message_id
    - return data
    	-

* Show Specific message
    params[:type_id]
    'get' users/:id/houses/:house_id/messages
    - return data
    	- {
            "id": 2,
            "user_id": 1,
            "house_id": null,
            "message_type": null,
            "content": "hi",
            "created_at": "2015-02-15T02:55:18.983Z",
            "updated_at": "2015-02-15T02:55:18.983Z"
        }

***
VENMO/PAYMENTS
***

* Create new payments
    'post' users/:id/houses/:house_id/payments
    - expecting data in this format
        - {
              payment:
                {
                  receiver_id: "1",
                  payer_id: "2",
                  amount: 6,
                  description: "do the dishes",
                  fulfilled: 1
                }
            }

* Show all payments for your house
    'get' users/:id/houses/:house_id/payments
    - expecting data in this format
    	- [
            {
                "id": 1,
                "receiver_id": null,
                "payer_id": null,
                "amount": 6,
                "description": null,
                "fulfilled": null,
                "created_at": "2015-02-15T05:03:46.228Z",
                "updated_at": "2015-02-15T05:03:46.228Z"
            },
            {
                "id": 2,
                "receiver_id": null,
                "payer_id": null,
                "amount": 7,
                "description": null,
                "fulfilled": null,
                "created_at": "2015-02-15T05:03:50.519Z",
                "updated_at": "2015-02-15T05:03:50.519Z"
            },
            {
                "id": 3,
                "receiver_id": null,
                "payer_id": null,
                "amount": 8,
                "description": null,
                "fulfilled": null,
                "created_at": "2015-02-15T05:03:52.233Z",
                "updated_at": "2015-02-15T05:03:52.233Z"
            }
          ]

* Show individual payments
    'get' users/:id/houses/:house_id/payments/:payments_id
    - return data
    	- {
            "id": 3,
            "receiver_id": null,
            "payer_id": null,
            "amount": 8,
            "description": null,
            "fulfilled": null,
            "created_at": "2015-02-15T05:03:52.233Z",
            "updated_at": "2015-02-15T05:03:52.233Z"
        }
