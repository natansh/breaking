require 'spec_helper'

describe "Authentication" do
  subject { page }
  describe 'Login page' do
    before { visit signin_path }
    it { should have_selector('h1', :text => 'Log in')}
    it { should have_selector('title', :text => 'Log in')}
  end

  describe 'Log in' do
    before { visit signin_path }
    describe 'when invalid information is entered' do
      before do
        fill_in 'Email', with: 'invalid'
        fill_in 'Password', with: ''
        click_button 'Log in'
      end
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email
        fill_in "Password", with: user.password
        click_button "Log in"
      end

      it { should have_selector('title', text: user.name) }
      it { should have_link('Profile', href: user_path(user)) }
      it { should have_link('Sign out', href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
    end
  end
end
