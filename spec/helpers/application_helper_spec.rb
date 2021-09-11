# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  # describe '#active?' do
  #   it 'returns active if the current controller and action matches' do
  #     allow(controller).to receive(:action_name) {'index'}
  #     expect(active?('test', 'index')).to eq('active')
  #   end
  #
  #   it 'returns an empty string if the current controller does not match the name' do
  #     allow(controller).to receive(:action_name) {'index'}
  #     expect(active?('nothing', 'index')).to eq('')
  #   end
  # end

  describe '#title' do
    it 'returns content for the page title' do
      title('About')
      expect(content_for(:title)).to eq('About')
    end
  end

  describe '#description' do
    it 'returns content for the page description' do
      description('A page describing the application')
      expect(content_for(:description)).to eq('A page describing the application')
    end
  end

  describe '#format_date' do
    it 'returns -- if the date is blank' do
      expect(format_date(nil)).to eq('--')
    end

    it 'returns the default format for times if no format is supplied' do
      expect(format_date(Time.zone.now)).to eq(Time.zone.now.strftime('%b %-d, %Y %l:%M %p'))
    end

    it 'returns the default format for dates if no format is supplied' do
      expect(format_date(Date.current)).to eq(Date.current.strftime('%b %-d, %Y'))
    end

    it 'returns the correct format if a format is supplied' do
      expect(format_date(Time.zone.now, :dstamp)).to eq(Time.zone.now.strftime('%b %-d, %Y'))
    end
  end
end
