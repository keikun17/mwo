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

- [x] MWO::Weapon.all

Scoped weapons

- [x] MWO::Weapon.ballistic
- [x] MWO::Weapon.energy
- [x] MWO::Weapon.missile

### Mechs

#### By Faction

- [ ] MWO::Mech.all
- [ ] MWO::Mech.inner_sphere
- [ ] MWO::Mech.clan

#### By Weight class

- [ ] MWO::Mech.lights
- [ ] MWO::Mech.mediums
- [ ] MWO::Mech.heavies
- [ ] MWO::Mech.assualts

#### Chain em

    MWO::Mech.clan.lights
    MWO::Mech.inner_sphere.assaults

### Omniparts

- [ ] MWO::Omniparts.all

## Contributing

1. Fork it ( https://github.com/[my-github-username]/mwo/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
