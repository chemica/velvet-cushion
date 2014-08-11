# VelvetCushion

![Gem Version](https://badge.fury.io/gh/chemica%2Fvelvet-cushion.svg)

[![Stories in Ready](https://badge.waffle.io/chemica/velvet-cushion.png?label=ready&title=Ready)](https://waffle.io/chemica/velvet-cushion)
![Build status](https://travis-ci.org/chemica/velvet-cushion.svg?branch=master)

[![Code Climate](https://codeclimate.com/github/chemica/velvet-cushion.png)](https://codeclimate.com/github/chemica/velvet-cushion)

VelvetCushion will allow JSON or other mark-up to recursively 'stuff' ActiveRecord models
with data, respecting associations such as 'has_many' and 'belongs_to'.

## Installation

While under development you'll have to either download the gem itself or point bundler at this github project. 

Add this line to your application's Gemfile:

    gem 'velvet-cushion', github: "chemica/velvet-cushion"

And then execute:

    $ bundle

## Usage

In your activerecord definition invoke cushion behaviour and optionally specify a decoder:

    class MyModel << ActiveRecord::Base
      acts_as_cushion decoder: :json
    
    ...

The decoder will default to `:json`

Then you can convert JSON to ActiveRecord objects with:

    my_instance = MyModel.new
    my_instance.stuff_with json_string 

You can override the default decoder with:

    my_instance = MyModel.new
    my_instance.stuff_with json_string, decoder: :simple_xml
    
To create your own decoder, simply define a class under the `VelvetCushion::Decoders` namespace:

    require 'json'
    
    module VelvetCushion
      module Decoders
        class Foo
          def decode(json)
            JSON.parse json
          end
        end
      end
    end

    ...
    
    my_instance = MyModel.new
    my_instance.stuff_with json_string, decoder: :foo
    
Your decoder just needs to produce a JSON style hash to work. You can also specify your own decoders in the model definition.


## Known limitations

As testing coverage is currently not 100% in key areas, use of this gem is not advised.

If the input data specifies an object multiple times, velvet-cushion will blindly create duplicate models. This could lead to data duplication on save.

If you are persisting this data to a database or other storage, no checks are made for the previous existence of records. This could lead to data duplication on save.


## Contributing

1. Fork it ( http://github.com/<my-github-username>/velvet-cushion/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Ensure your change passes on Travis CI or it simply won't go in.
Ensure you've added specs to test any new functionality (or to prove that a bug fix is successful). 
Use Code Climate if possible to minimise complexity and code smells. 
