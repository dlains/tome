require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user)     { create(:user) }
  let(:new_post) { create(:post) }

  # describe 'GET index' do
  #   before do
  #     get :index
  #   end
  #
  #   it_behaves_like 'a successful response'
  #   it_behaves_like 'a template renderer', 'index'
  #
  #   it 'assigns @posts' do
  #     expect(assigns(:posts)).to eq([new_post])
  #   end
  # end
  #
  # describe 'GET show' do
  #   before do
  #     get :show, params: { id: new_post.slug }
  #   end
  #
  #   it_behaves_like 'a successful response'
  #   it_behaves_like 'a template renderer', 'show'
  #
  #   it 'assigns @post' do
  #     expect(assigns(:post)).to eq(new_post)
  #   end
  # end

  describe 'GET new' do
    before do
      sign_in user
      get :new
    end

    it_behaves_like 'a successful response'
    it_behaves_like 'a template renderer', 'new'

    it 'assigns @post' do
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe 'GET edit' do
    before do
      sign_in user
      get :edit, params: { id: new_post.slug }
    end

    it_behaves_like 'a successful response'
    it_behaves_like 'a template renderer', 'edit'

    it 'assigns @post' do
      expect(assigns(:post)).to eq(new_post)
    end
  end

  describe 'POST create' do
    before do
      sign_in user
    end

    it 'should create a new post' do
      post :create, params: { post: attributes_for(:post, user_id: user.id) }
      expect(Post.count).to eq(1)
    end

    it 'should redirect to the posts page' do
      post :create, params: { post: attributes_for(:post, user_id: user.id) }
      expect(response).to redirect_to(posts_path)
    end

    it 'should redirect to the create page if there is an error' do
      post :create, params: { post: {title: nil} }
      expect(response).to render_template(:new)
    end

    it 'should set the published_at date if necessary' do
      post :create, params: { post: attributes_for(:post, user_id: user.id, published: true) }
      expect(Post.first.published_at).to_not be_nil
    end
  end

  describe 'PUT update' do
    before do
      sign_in user
    end

    it 'should update a post' do
      put :update, params: { id: new_post.slug, post: {title: 'Test Name'} }
      expect(new_post.reload.title).to eq('Test Name')
    end

    it 'should redirect to the posts page' do
      put :update, params: { id: new_post.slug, post: {title: 'Test Name'} }
      expect(response).to redirect_to(posts_path)
    end

    it 'should redirect to the edit form if there is an error' do
      put :update, params: { id: new_post.slug, post: {title: nil} }
      expect(response).to render_template(:edit)
    end
  end

  # describe 'DELETE destroy' do
  #   it 'should delete a post' do
  #     delete :destroy, params: { id: new_post.slug }
  #     expect(Post.count).to eq(0)
  #   end
  #
  #   it 'should redirect to the index page' do
  #     delete :destroy, params: { id: new_post.slug }
  #     expect(response).to redirect_to(admin_posts_url)
  #   end
  # end
end
