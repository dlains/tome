# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TagsController, type: :controller do
  let(:post) { create(:post) }

  describe 'GET index' do
    before do
      get :index
    end

    it_behaves_like 'a successful response'
    it_behaves_like 'a template renderer', 'index'
  end

  describe 'GET show' do
    before do
      get :show, params: { id: post.tags.first }
    end

    it_behaves_like 'a successful response'
    it_behaves_like 'a template renderer', 'show'
  end
end
