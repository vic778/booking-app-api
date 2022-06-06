# BOOKING-APP-API


> This is the backend for the [booking-app](https://github.com/afizsavage/booking-app) web application for motorcycle reservations: you have a list of motorcycles that a user can reserve for a certain period of time. The backend is a REST API that allows you to create, read, update and delete motorcycles. It also allows you to create, read, update and delete reservations.
This API is made these models:
- User model
- Motorcycle model
- Reservation model
- My_Reservation Model

### Deployment
[Base URL](https://sheltered-tor-84017.herokuapp.com/)


The API has the following endpoints:


allow user to authenticate and return a token

`POST /api/v1/auth/login`

allows user to create an account

`POST /api/v1/users/register`

Edit user informations

`PUT /api/v1/users/:id`

Delete user informations

`DELETE /api/v1/users/:id`

returns all motorcycles

`GET /api/v2/motorcyles `

allows user to create a motorcyles

`POST /api/v2/motorcyles/new`

returns a specific motorcyle

`GET /api/v2/motorcyles/:id`

allows user to edit a motorcyle

`PUT /api/v2/motorcyles/:id`

allows user to delete a motorcycle

`DELETE /api/v2/motorcyles/:id`

allows user to get all available motorcycles

`GET /api/v2/available_motorcycles`

allows user to create a new reservation

`POST /api/v2/reservations/new`

allows user to get all motorcycles reserved 

`GET /api/v2/my_reservations`

allows user to get a specific reserved motorcycle 

`GET /api/v2/reserve_motorcycle/:id`

allows user to update a reservation  

`PUT /api/v2/reservations/:id`

allows user to cancel a reservation 

`DELETE /api/v2/reservations/:id`


## Built With

- Rails
- Ruby 
- Postgresql
- JWT
- ActiveRecord Serializer
- ActiveRecord Image Uploader
- Heroku

## Getting Started

Here are the steps to follow in order to get this project on your local computer.

### Prerequisites

`rails v7.0.2 +`

`ruby v3.0.2 +`

### Setup

clone this repo by typing `git clone https://github.com/vic778/booking-app-api.git`

### Install

install the dependencies by typing `bundle install`

### Usage

start the local server by running `rails s`

### Testing

run the tests by typing `bundle exec rspec`


### Documentation


## Author

👤 **Victor Barh**

- GitHub: [@Vvic778](https://github.com/vic778)
- Twitter: [@victoirBarh](https://twitter.com/)
- LinkedIn: [LinkedIn](https://linkedin.com/in/victoir-barh)

👤 **Ricky Mormor**

- GitHub: [@cwaku](https://github.com/cwaku)
- Twitter: [@rickymormor](https://twitter.com/rickymormor)
- LinkedIn: [Ricky Mormor](https://github.com/cwaku/blog/blob/develop/www.linkedin.com/in/rickymormor)


## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

 N/A

## 📝 License

This project is [MIT](lic.url) licensed.

