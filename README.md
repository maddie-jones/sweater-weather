# README

# Project Title

Sweater Weather is a backend API that is meant to be consumed by a front end weather site.
It follows these [specs](http://backend.turing.io/module3/projects/sweater_weather)


## Getting Started
You will need an API key from DarkSkiAPI, GoogleGeocodeAPI and FlickrAPI for the tests to pass. These will need to be set up as the following environment variables:
```
ENV[YOUTUBE_API_KEY]
ENV[GITHUB_TOKEN]
```

If you wish to install our app locally, you can fork or clone the repository here. Installation steps once cloned are as follows:
Install the gem packages
```
$ bundle install
```

Set up the database
```
$ rake db:create
$ rake db:migrate
$ rake db:seed
```

You can also visit the [Heroku](https://sweater-weather-mine.herokuapp.com)

## Running the tests

Once the app is installed locally, you can run the test suite:
```
bundle exec rspec
```

### Tests
An example of our tests:

```
require 'rails_helper'

describe 'Login Api', :vcr do
  it 'can login a user' do
    user_1 = User.create(password: "password", email: "whatever@example.com", password_confirmation: "password")
    user_2 = User.create(password: "password", email: "maddie@example.com", password_confirmation: "password")
    params = {
              email: "whatever@example.com",
              password: "password"
    }

    post "/api/v1/sessions", params: params

    expect(response).to have_http_status(:ok)

    expect(JSON.parse(response.body)).to eq({"api_key" => user_1.api_key})
  end

  it 'cannot login user with wrong password' do
    user_1 = User.create(password: "password", email: "whatever@example.com", password_confirmation: "password")
    user_2 = User.create(password: "password", email: "maddie@example.com", password_confirmation: "password")
    params = {
              email: "whatever@example.com",
              password: "hello"
    }

    post "/api/v1/sessions", params: params

    expect(response).to have_http_status(:unauthorized)

    expect(JSON.parse(response.body)).to eq({"error" => "401 unauthorized"})
  end
end

```

## Built With

* [Ruby 2.4.1](https://ruby-doc.org/core-2.4.1/)
* [Rails 5.2.2](https://guides.rubyonrails.org/)
* [GitHub Projects for Project Management](https://help.github.com/articles/about-project-boards/)
* [Faraday](https://github.com/lostisland/faraday)
* [Heroku](https://www.heroku.com/)
* [RSpec](http://rspec.info/)
* [vcr](https://github.com/vcr/vcr)


## Versioning

We used [GitHub](https://github.com/) for versioning.
We used [Waffle.io](https://waffle.io/) as a project management tool.

## Authors

* **Maddie Jones** - [maddyg91](https://github.com/maddyg91)

## Acknowledgments

We would like to thank our fantastic Mod 3 instructors [Mike](https://github.com/mikedao) and [Sal](https://github.com/s-espinosa) for your help with this project and in general at Turing!
