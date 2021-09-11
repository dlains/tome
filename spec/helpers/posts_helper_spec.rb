# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsHelper, type: :helper do
  let(:post) { create(:post) }

  describe '#markdown_full' do
    it 'should render the markdown to html' do
      expect(markdown_full(post)).to include('<')
      expect(markdown_full(post)).to include('>')
    end
  end

  describe '#markdown_summary' do
    it 'should render the markdown to html' do
      expect(markdown_summary(post)).to include('<')
      expect(markdown_summary(post)).to include('>')
    end
  end
end
