require 'rails_helper'

RSpec.describe InvitesController do
  let(:user) { User.create!(username: 'pato', email: 'pato@gmail.com') }
  let(:event) do
    Event.create!(title: 'Ruby Docs', about: 'Blah',
                  day: '2020-05-25 15:39:19.35599 +0300', location: 'LakeHub',
                  creator_id: 1)
  end
  context 'GET #index' do
    it 'renders the template :index' do
      user
      event 
      allow_any_instance_of(InvitesController).to receive(:current_user).and_return(user)
      get :index, params: {event_id: 1}
      expect(response).to render_template(:index)
    end
  end
end
