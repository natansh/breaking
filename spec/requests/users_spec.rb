require 'spec_helper'

describe 'User pages' do

  subject { page }

  describe 'signup page' do
    before { visit signup_path }

    it { should have_selector('h1', :text => 'Sign up')}
    it { should have_selector('title', :text => 'Sign up')}
  end

  describe 'signup' do
    let(:submit) { "Sign up"}

    before { visit signup_path }

    describe 'with valid information' do
      before do
        fill_in 'Name', with: 'Example User' 
        fill_in 'Email', with: 'user@hoogle.com'
        fill_in 'Password', with: 'foobarab'
        fill_in 'Confirmation', with: 'foobarab'
      end

      it 'should create a new user' do
        expect { click_button submit}.to change(User, :count).by(1)
      end

      describe 'after saving the user' do
        before { click_button submit }
        it { should have_link('Log out') }

        describe 'followed by logout' do
          before { click_link 'Log out' }
          it { should have_link('Log in') }
        end
      end

    end

    describe 'with invalid information' do
      it 'should not create a user' do
        expect {click_button submit}.not_to change(User, :count)
      end
    end
  end

  describe 'profile page' do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_selector('h1', :text => user.name) }
    it { should have_selector('title', :text => user.name) }
  end
end
