require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  describe 'GET new' do
    before do
      get :new
    end

    it_behaves_like 'a successful response'
    it_behaves_like 'a template renderer', 'new'

    it 'assigns @user' do
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe 'POST create' do
    it 'should create a new user' do
      post :create, params: { user: attributes_for(:user) }
      expect(User.count).to eq(1)
    end

    it 'should redirect to the root path' do
      post :create, params: { user: attributes_for(:user) }
      expect(response).to redirect_to(root_path)
    end

    it 'should redirect to the create page if there is an error' do
      post :create, params: { user: {email: nil} }
      expect(response).to render_template(:new)
    end
  end
end
