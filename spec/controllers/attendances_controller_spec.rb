require 'rails_helper'
RSpec.describe AttendancesController, type: :controller do
  #   context 'GET # index' do
  #     it 'should have a 200 status code' do
  #       get :index, params: { event_id: "1" }
  #       expect(response.status).to eq(200)
  #     end
  #   end

  context 'POST #create' do
    it 'responds to html' do
      post :create, params: { event_id: 1, email: 'pato@gmail.com' }
      expect(response.content_type).to eq 'text/html; charset=utf-8'
    end
  end
end
