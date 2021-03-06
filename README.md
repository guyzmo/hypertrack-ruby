[![Gem Version](https://badge.fury.io/rb/hypertrack.svg)](https://badge.fury.io/rb/hypertrack) [![Build Status](https://travis-ci.org/utsavkesharwani/hypertrack-ruby.svg)](https://travis-ci.org/utsavkesharwani/hypertrack-ruby) [![Code Coverage](https://img.shields.io/codecov/c/github/utsavkesharwani/hypertrack-ruby.svg)](https://codecov.io/gh/utsavkesharwani/hypertrack-ruby)

# HyperTrack RubyGem
A RubyGem for [HyperTrack](https://www.hypertrack.io/)'s [Backend API](https://docs.hypertrack.com/v3/api/guides/basic.html)

## Installation

Add this line to your application's Gemfile:
```ruby
gem 'hypertrack'
```

And then run `bundle install` on command line.

Or install it yourself as: `gem install hypertrack`

## Initialization:
```ruby
require 'hypertrack'
HyperTrack.secret_key = "<YOUR_SECRET_KEY>"
HyperTrack.api_version = "v2" # default is v1
```

## HyperTrack - API and Resources

- [User](https://docs.hypertrack.com/v3/api/entities/user.html)
  - [Create](https://docs.hypertrack.com/v3/api/entities/user.html#create-a-user)
    ```ruby
    HyperTrack::User.create(name: "Mike harris", vehicle_type: "car")
    ```
    
  - [Retrieve](https://docs.hypertrack.com/v3/api/entities/user.html#retrieve-a-user)
    ```ruby
    HyperTrack::User.retrieve(user_id)
    ```

  - [Update](https://docs.hypertrack.com/api/entities/user.html#update-a-user)
    ```ruby
    user = HyperTrack::User.retrieve(user_id)
    user.update(name: "Mike J harris")
    ```

  - [List all](https://docs.hypertrack.com/v3/api/entities/user.html#list-all-users)
    ```ruby
    HyperTrack::User.list
    ```

  - [Assign Actions to User](https://docs.hypertrack.com/v3/api/entities/user.html#assign-actions-to-a-user)
    ```ruby
    user = HyperTrack::User.retrieve(user_id)
    user.assign_actions({action_ids: [action_id_1, action_id_2]})
    ```

  - [Location-based Assignment - Find Nearby Users](https://docs.hypertrack.com/api/entities/user.html#list-nearby-users)
    ```ruby
    # Near an action's expected place
    users = HyperTrack::User.nearby({action_id: "0a874ed1-a4f4-4786-8319-a5d75bc9948b"})

    # Near a specified location in (longitude,latitude) format
    users = HyperTrack::User.nearby({location: "77.626479,12.936736", radius: 1000})
    ```

- [Action](https://docs.hypertrack.com/v3/api/entities/action.html)
  - [Create](https://docs.hypertrack.com/v3/api/entities/action.html#create-an-action)

    ```ruby
    place = {location: {type: "Point", coordinates: [77.63, 12.929]}} # GeoJSON format
    HyperTrack::Action.create(type: 'pickup', expected_place: place)
    ```
    
  - [Retrieve](https://docs.hypertrack.com/v3/api/entities/action.html#retrieve-an-action)

    ```ruby
    HyperTrack::Action.retrieve(action_id)
    ```
  
  - [List](https://docs.hypertrack.com/v3/api/entities/action.html#list-all-actions)

    ```ruby
    HyperTrack::Action.list
    ```

  - [Complete](https://docs.hypertrack.com/v3/api/entities/action.html#complete-an-action)

    ```ruby
    action = HyperTrack::Action.retrieve(action_id)
    action.complete()
    ```

  - [Cancel](https://docs.hypertrack.com/v3/api/entities/action.html#cancel-action)

    ```ruby
    action = HyperTrack::Action.retrieve(action_id)
    action.cancel()
    ```

  - [Mileage Tracking - Meter an Action](https://docs.hypertrack.com/v3/api/entities/action.html#meter-an-action)

    ```ruby
    action = HyperTrack::Action.retrieve(action_id)
    result = action.meter()
    ```