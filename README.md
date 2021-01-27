# Active-Auction

Active Auction is a simple online-auction platform. Users can create and manage their own listings, as well as browse the listings of other users.  The platform facilitates the bidding process, as well as standard auction features such as reserve prices, and questions for the seller.  Users are notified when they are outbid, or when a question is answered via a personal 'dashboard' page.

This app was created to satisfy the requirements of The Flatiron School's Rails Portfolio Project.  This project was focused on creating a complete Ruby on Rails application to manage related data through the use of complex forms and RESTful routes. It also showcases the use of user accounts, external provider authentication (Omniauth), user authorization, and form input validation.

## Installation

First,
```bash
bundle install
```
to install required gems/dependencies.

Next run
```bash
rails db:migrate
```
to create the database.

*To seed the databse with fake test data:*
```bash
rails db:seed
```
 
## Usage

To use the app:

run:
```bash
rails s
```

Next, open your browser and enter

localhost:3000

in the address bar and hit enter.  This should take you to the login/signup page!

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](https://choosealicense.com/licenses/mit/)