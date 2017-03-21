require 'rails_helper'

describe 'navigate' do
  describe 'home' do
    it 'must be accessible' do
      visit root_path
      expect(page.status_code).to eq(200)
    end
  end
end
