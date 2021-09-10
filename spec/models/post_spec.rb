require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { build(:post) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a slug' do
    subject.slug = nil
    expect(subject).to_not be_valid
  end

  it 'returns the slug as the id' do
    expect(subject.to_param).to eq(subject.slug)
  end
end
