require 'spec_helper'

describe Contact do
  describe 'new_contacts' do
    it "does what I need it to do" do
      FactoryGirl.create(:contact, first_name: 'Simba')
      FactoryGirl.create(:contact, first_name: 'Nala')

      # expect(Contact.first_name('Simba')).to be_valid
      # expect(Contact.first_name('Nala')).to be_valid
    end

    it "creates a contact inquiry" do
      expect(Contact.new)
    end
  end
end

#Fix this to apply to EventTracker