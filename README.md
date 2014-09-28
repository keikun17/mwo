# Mwo

Ruby gem for interfacing with Mechwarrior Online's public API

http://mwomercs.com/forums/topic/164685-betatesting-for-our-json-reference-files-the-start-of-the-api-details-within/

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mwo'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mwo

## Usage

### Weapons

Get a list of all weapons

```ruby
MWO::Weapon.all
MWO::Weapon.all_raw # if you want the json response from the api
```

Scoped weapons

### By Category

```ruby
MWO::Weapon.ballistic
MWO::Weapon.energy
MWO::Weapon.missile
```

### By Faction

```ruby
MWO::Weapon.clan
MWO::Weapon.innersphere
```

### Mechs

List all Mechs

```ruby
MWO::Mech.all
MWO::Mech.all_raw # if you want the json response from the api
```

##### Lists the Mech ID with their corresponding variants

```ruby
MWO::Mech.dictionary # Lists the Mech ID with their corresponding variants
```

#### By Weight class

```ruby
MWO::Mech.lights
MWO::Mech.mediums
MWO::Mech.heavies
MWO::Mech.assaults
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/mwo/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
