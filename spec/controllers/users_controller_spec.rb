require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context 'GET # new' do
    it 'has a 200 status code' do
      get :new
      expect(response.status).to eq(200)
    end

    it 'Renders :new template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'Assigns new User to @User' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  context 'POST # create' do
    it 'responds to HTML by default' do
      post :create, params: { username: 'Pato', email: 'pato@gmail.com' }
      expect(response.content_type).to eq 'text/html; charset=utf-8'
    end
  end
end
