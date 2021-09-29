# Sweater Weather

[![Contributors][contributors-shield]][contributors-url]
[![Issues][issues-shield]][issues-url]
[![Stargazers][stars-shield]][stars-url]
[![Forks][forks-shield]][forks-url]

## Welcome to Sweater Weather - A project of Turing School of Software and Design

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

## Table of Contents

- [Overview](#overview)
- [Tools Utilized](#framework)
- [Setup and Things to Note](#project-configuration)

## Overview

`Sweater Weather`: An API designed to consume other API's, calculate distance between two locations, and give the forecast at the expected arrival time of the destination

### Framework
<p>
  <img src="https://img.shields.io/badge/Ruby%20On%20Rails-b81818.svg?&style=flat&logo=rubyonrails&logoColor=white" />
</p>

### Languages
<p>
  <img src="https://img.shields.io/badge/Ruby-CC0000.svg?&style=flaste&logo=ruby&logoColor=white" />
  <img src="https://img.shields.io/badge/ActiveRecord-CC0000.svg?&style=flaste&logo=rubyonrails&logoColor=white" />
</p>

### Tools
<p>
  <img src="https://img.shields.io/badge/Git-F05032.svg?&style=flaste&logo=git&logoColor=white" />
  <img src="https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white" />
  <img src="https://img.shields.io/badge/Postman-FF6E4F.svg?&style=flat&logo=postman&logoColor=white" />
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1.svg?&style=flaste&logo=postgresql&logoColor=white" />
</p>

### Gems
<p>
  <img src="https://img.shields.io/badge/rspec--rails-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/pry-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/standard-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/simplecov-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  </br>
  <img src="https://img.shields.io/badge/capybara-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/bcrypt-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/figaro-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/faraday-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  </br>
  <img src="https://img.shields.io/badge/webmock-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/fast_jsonapi-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/factory_bot_rails-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  </br>
  <img src="https://img.shields.io/badge/shoulda--matchers-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/faker-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/vcr-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
</p>

### Development Principles
<p>
  <img src="https://img.shields.io/badge/OOP-b81818.svg?&style=flaste&logo=OOP&logoColor=white" />
  <img src="https://img.shields.io/badge/TDD-b87818.svg?&style=flaste&logo=TDD&logoColor=white" />
  <img src="https://img.shields.io/badge/REST-33b818.svg?&style=flaste&logo=REST&logoColor=white" />
</p>


![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- MARKDOWN LINKS & IMAGES -->

[contributors-shield]: https://img.shields.io/github/contributors/Jacobmar13/sweater_weather.svg?style=flat
[contributors-url]: https://github.com/Jacobmar13/sweater_weather/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Jacobmar13/sweater_weather.svg?style=flat
[forks-url]: https://github.com/Jacobmar13/sweater_weather/network/members
[stars-shield]: https://img.shields.io/github/stars/Jacobmar13/sweater_weather.svg?style=flat
[stars-url]: https://github.com/Jacobmar13/sweater_weather/stargazers
[issues-shield]: https://img.shields.io/github/issues/Jacobmar13/sweater_weather.svg?style=flat
[issues-url]: https://github.com/Jacobmar13/sweater_weather/issues


## Endpoints

* All available endpoints are documented on the [Endpoints](https://github.com/Jacobmar13/sweater_weather/wiki/Endpoints) wiki

## Project Configuration

### Basic Setup

  * Fork and Clone this repo locally
  * Run
    ```bash
    $ bundle install
    $ rails db:{create,migrate}
    ```
  * Figaro is used for holding and hiding API keys for the API's listed below, so Figaro must be installed
    ```bash
    $ bundle exec figaro install
    ```
  * This will create a file in your `config` folder labelled `application.yml`. All keys created at API sites will be stored here

### API Dependecies and Setup

  * This API project consumes other APIs, three to be exact
  * As a result, accounts will need to be made for these API's if you want to use this project locally, or some of the endpoints and tests will fail

#### [Mapquest](https://www.mapquest.com/)

* Mapquest was used for it's location and directions endpoints, and needs a developer account for access to both a Consumer Key and a Consumer Secret
* Sign up here: https://developer.mapquest.com/
* Once you have the key and secret, you can put them in your `application.yml` like so:
  ```yml
  MAPQUEST_ACCESS_KEY: YourMapquestConsumerKey
  MAPQUEST_SECRET: YourMapquestConsumerSecret
  ```

#### [Open Weather](https://openweathermap.org/)

* Open Weather was used for it's One Call API endpoint, used to for detailed forecasts for a given location, and needs a single API key
* Sign up here: https://openweathermap.org/api
* Once you have the key, you can put it in your `application.yml` like so:
  ```yml
  OPEN_WEATHER_ACCESS_KEY: YourOpenWeatherKey
  ```

#### [Unsplash](https://unsplash.com/?utm_source=sweater_weather&utm_medium=referral)

* Unsplash was used for it's Image Search endpoint, used for getting a location picture to go with the weather forecast, and needs a developer account for access to both an Access Key and a Secret Key
* Sign up here: https://unsplash.com/developers
* Once you have the Access Key and Secret Key, you can put it in your `application.yml` like so:
  ```yml
  UNSPLASH_ACCESS_KEY: Client-ID YourUnsplashAccessKey
  UNSPLASH_SECRET: YourUnsplashSecretKey
  ```

### Ruby and Rails Version

  ```bash
  $ ruby -v
  ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-darwin20]
  $ rails -v
  Rails 5.2.6
  ```

### How to run the test suite:

  ```bash
  $ bundle exec rspec -fd
  ```

### Local Deployment, for testing:

  ```bash
  $ rails s
  ```

  * From here you may access the [endpoints](https://github.com/Jacobmar13/sweater_weather/wiki/Endpoints) from a utility like `Postman`, neccesary for the `post` endpoints

Find the [project spec here](https://backend.turing.edu/module3/projects/sweater_weather/)

### [Schema Design](https://dbdiagram.io)

<p align="center">
  <img src="https://user-images.githubusercontent.com/80134340/135241011-793642cd-1d38-4cb7-8fa5-9d1d90c48cbb.png"/>
</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

