require 'rails_helper'
RSpec.describe AttendancesController, type: :controller do
  let(:user) { User.create!(username: 'pato', email: 'pato@gmail.com') }
  let(:event) do
    Event.create!(title: 'Ruby Docs', about: 'Blah',
                  day: '2020-05-25 15:39:19.35599 +0300',
                  location: 'LakeHub', creator_id: 1)
  end

  context 'GET # index' do
    it 'should have a 200 status code' do
      user
      event
      get :index, params: { event_id: '1' }
      expect(response.status).to eq(200)
    end
  end

  context 'POST #create' do
    it 'responds to html' do
      user
      event
      post :create, params: { event_id: 1, email: 'pato@gmail.com' }
      expect(response.content_type).to eq 'text/html; charset=utf-8'
    end
  end
end
