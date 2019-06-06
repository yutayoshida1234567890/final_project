require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:events) }

    it { should have_many(:ratings) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
