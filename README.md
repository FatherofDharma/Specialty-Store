# _Specialty Store - Ruby Independent Project Four_

 A independent project for the Ruby course for the coding school, Epicodus, written on August 9, 2019.

#### By _**Daniel Hongel**_

## Description

This application is an independent coding project from a Ruby coding class at Epicodus. This application is intended to demonstrate an understanding of Ruby and the Rails framework. This is a website an online store that carries specialty products.

## Setup/Installation Requirements

* _Clone this repository_
* _Open terminal and type 'git clone [git link]'_
* _Navigate to project directory using cd in terminal_
* _Open project in text editor (atom .)_
* _Type 'bundle install' in terminal to load Gems_
* _To run tests, type 'rspec' in terminal_
* _To run the program, type ruby app.rb in terminal_
* _Open your preferred web browser and navigate to localhost:4567_

## Specs

| Behavior | Input | Output |
| ------------- |:-------------:| -----:|
|validates a new product only requiring all fields to be filled in|New product: Name: Kukri, Cost $50, Country of Origin: " " | Will throw an error and not create new product|
|allows the user to create new product listings|New Product: Name: Kukri, Cost: 50, Country of Origin: USA|Kukri Cost: $50, From: USA|
|does not allow a user to post a review of a product if it has less than 50 characters or more thamn 250|I hate this thing!|Please address these problems: Content body is too short (minimum is 50 characters.)|
|allows a user to post a review with a required rating (between 1-5) of a product|Author: Jon Content: This thing is amazing, and I am so happy! You should get one right away! Rating: 4|Kukri; Jon says: This thing is amazing, and I am so happy! They gave this product a rating of 4|
|allows a user to remove a review|Kukri Author: Dan Review: I hate this thing!|Kukri Review: There are no reviews for this product|

## Known Bugs

No known bugs

## Support and contact details

Please contact me if you encounter issues with this program, have suggestions, or would like to contribute to this or future projects. I can be reached at:  fatherofdharma@gmail.com.

## Technologies Used

* Ruby
* RubyGems
* Atom
* GitHub
* PostgreSQL
* Rails

### License
_This software is licensed under MIT license._

Copyright (c) 2019 **_Daniel Hongel_**
