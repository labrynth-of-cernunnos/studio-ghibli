require 'pry'

RSpec.describe Findable do

  context 'can create films' do
    it "starts with 0 Films in array" do
      expect(StudioGhibli::Film.all).to eq([])
    end

    it "populates films array with hashes" do
      films_hash = StudioGhibli::Film.find_or_create('films')

      expect(films_hash[0]).to be_kind_of(Hash)
      expect(films_hash.count).to be(20)
    end

    it "sets the hash keys to instance variables" do
      api_response  = StudioGhibli::Api.new.fetch('films')
      new_film  = StudioGhibli::Film.new(api_response[5])
      response_keys = api_response[5].collect {|k,v|  k.to_sym if v != nil  }
      created_methods = response_keys.select{|key| new_film.respond_to?(key)}

      expect(created_methods.length).to be(7)
    end
  end

  context 'can create people' do
    it "starts with 0 people in array" do
      expect(StudioGhibli::Person.all).to eq([])
    end

    it "populates person array with hashes" do
      people_hash = StudioGhibli::Person.find_or_create('people')

      expect(people_hash[0]).to be_kind_of(Hash)
      expect(people_hash.count).to be(31)
    end

    it "sets the hash keys to instance variables" do
      api_response  = StudioGhibli::Api.new.fetch('people')
      new_film  = StudioGhibli::Person.new(api_response[3])
      response_keys = api_response[3].collect {|k,v|  k.to_sym if v != nil  }
      created_methods = response_keys.select{|key| new_film.respond_to?(key)}

      expect(created_methods.length).to be(8)
    end
  end

  context 'can create locations' do
    it "starts with 0 Locations in array" do
      expect(StudioGhibli::Location.all).to eq([])
    end

    it "populates locations array with hashes" do
      locations_hash = StudioGhibli::Location.find_or_create('locations')

      expect(locations_hash[0]).to be_kind_of(Hash)
      expect(locations_hash.count).to be(24)
    end

    it "sets the hash keys to instance variables" do
      api_response  = StudioGhibli::Api.new.fetch('locations')
      new_film  = StudioGhibli::Location.new(api_response[6])
      response_keys = api_response[6].collect {|k,v|  k.to_sym if v != nil  }
      created_methods = response_keys.select{|key| new_film.respond_to?(key)}

      expect(created_methods.length).to be(8)
    end
  end

  context 'can create species' do
    it "starts with 0 species in array" do
      expect(StudioGhibli::Species.all).to eq([])
    end

    it "populates species array with hashes" do
      species_hash = StudioGhibli::Species.find_or_create('species')

      expect(species_hash[0]).to be_kind_of(Hash)
      expect(species_hash.count).to be(6)
    end

    it "sets the hash keys to instance variables" do
      api_response  = StudioGhibli::Api.new.fetch('species')
      new_film  = StudioGhibli::Species.new(api_response[4])
      response_keys = api_response[4].collect {|k,v|  k.to_sym if v != nil  }
      created_methods = response_keys.select{|key| new_film.respond_to?(key)}

      expect(created_methods.length).to be(8)
    end
  end

  context 'can create vehicles' do
    it "starts with 0 vehicles in array" do
      expect(StudioGhibli::Vehicle.all).to eq([])
    end

    it "populates vehicles array with hashes" do
      vehicles_hash = StudioGhibli::Vehicle.find_or_create('vehicles')

      expect(vehicles_hash[0]).to be_kind_of(Hash)
      expect(vehicles_hash.count).to be(3)
    end

    it "sets the hash keys to instance variables" do
      api_response  = StudioGhibli::Api.new.fetch('vehicles')
      new_film  = StudioGhibli::Vehicle.new(api_response[2])
      response_keys = api_response[2].collect {|k,v|  k.to_sym if v != nil  }
      created_methods = response_keys.select{|key| new_film.respond_to?(key)}

      expect(created_methods.length).to be(8)
    end
  end
end
