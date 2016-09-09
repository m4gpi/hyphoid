
require 'standalone_migrations'
require './models/player'
require './spec/seed_data_helper'
require 'rspec'
require 'pry'

ActiveRecord::Base.establish_connection YAML.load_file('config/database.yml')["test"]

describe Mycelium do

  before do
    extend SeedData
  end

  it "should occupy a location"

  after do
    ActiveRecord::Base.connection.close
  end

end
