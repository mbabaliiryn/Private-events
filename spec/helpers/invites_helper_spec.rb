require 'rails_helper'

RSpec.describe InvitesHelper, type: :helper do
  let(:user) { User.create!(username: 'pato', email: 'pato@gmail.com') }
  let(:event) do
    Event.create!(title: 'Ruby Docs', about: 'Blah',
                  day: '2020-05-25 15:39:19.35599 +0300',
                  location: 'LakeHub', creator_id: 1)
  end
  context 'Uninvited Method' do
    it 'returns list of uninvited users' do
      user
      event
      evt = Event.find(1)
      usr = User.all
      expect(uninvited(evt, usr).size).to eq(1)
    end
  end
end
