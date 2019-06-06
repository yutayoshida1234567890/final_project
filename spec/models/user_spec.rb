require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:participants) }

    it { should have_many(:preferences) }

    it { should have_many(:ratings) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
