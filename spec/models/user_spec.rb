require 'rails_helper'

RSpec.describe User, type: :model do
  context 'user model validation' do
    it 'must have a username' do
      user = User.new(email: 'examole@gmail.com').save
      expect(user).to eq(false)
    end

    it 'must have an email' do
      user = User.new(username: 'example').save
      expect(user).to eq(false)
    end

    it 'username must be unique' do
      User.new(username: 'example', email: 'example@gmail.com').save
      user2 = User.new(username: 'example', email: 'exam@gmail.com').save
      expect(user2).to eq(false)
    end

    it 'email must be unique' do
      User.new(username: 'example', email: 'example@gmail.com').save
      user2 = User.new(username: 'exam', email: 'example@gmail.com').save
      expect(user2).to eq(false)
    end
  end
end
