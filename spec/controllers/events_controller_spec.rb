require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  context 'GET # index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  context 'GET # new' do
    it 'has a status code 302' do
      get :new
      expect(response.status).to eq(302)
    end
  end

  context 'GET # show' do
    it 'has a status of 302' do
      get :show, params: { id: 1 }
      expect(response.status).to eq(302)
    end
  end

  context 'POST # CREATE ' do
    it 'Responds to HTML by default' do
      post :create, params: { title: 'Deep Dive', day: '2020-05-25 15:39:19.35599 +0300', location: 'LakeHub', about: 'Lorem ipsum dolor' }
      expect(response.content_type).to eq 'text/html; charset=utf-8'
    end
  end
end
