require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) { create(:user) }

  describe 'POST create' do
    before do
      user
    end

    it 'should log in a user if authenticated' do
      post :create, params: { email: user.email, password: 'password' }
      expect(session[:user_id]).to eq(user.id)
    end

    it 'should redirect to the root page' do
      post :create, params: { email: user.email, password: 'password' }
      expect(response).to redirect_to(root_path)
    end

    it 'should redirect to the create page if there is an error' do
      post :create, params: { email: user.email, password: 'wrong' }
      expect(response).to render_template(:new)
    end
  end

  describe 'DELETE destroy' do
    before do
      sign_in user
    end

    it 'should log out a user' do
      delete :destroy
      expect(session[:user_id]).to eq(nil)
    end

    it 'should redirect to the root page' do
      delete :destroy
      expect(response).to redirect_to(root_path)
    end
  end
end
