# Readonlyable

ActiveRecord で ReadOnly なテーブル用の Model を作る時用のモジュール。

## Installation

Add this line to your application's Gemfile:

    gem 'readonlyable', git: 'git://github.com/akishin/readonlyable.git'

And then execute:

    $ bundle install --path vendor/bundle

## Usage

    class Posts < ActiveRecord::Base
      include Readonlyable

## License

MIT License
