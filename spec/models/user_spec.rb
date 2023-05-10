require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it 'is valid with all correct fields' do

      params = { first_name: 'josh', last_name: 'kelly', email: 'my@email.com', password: 'abc',  password_confirmation: 'abc' }
      expect(User.new(params)).to be_valid

    end
  

    it 'is invalid if passwords does not match confirmation' do

      params = { first_name: 'josh', last_name: 'kelly', email: 'my@email.com', password: 'abc',  password_confirmation: 'efg' }
      expect(User.new(params)).to_not be_valid

    end

    it 'is invalid with the password under 3 characters' do

      params = { first_name: 'josh', last_name: 'kelly', email: 'my@email.com', password: 'ab', password_confirmation: 'ab' }
      expect(User.new(params)).to_not be_valid

    end

    it 'is invalid without first name field' do

      params = { first_name: '', last_name: 'kelly', email: 'my@email.com', password: 'abc', password_confirmation: 'abc' }
      expect(User.new(params)).to_not be_valid
      
    end

    it 'is invalid without last name field' do

      params = { first_name: 'josh', last_name: '', email: 'my@email.com', password: 'abc', password_confirmation: 'abc' }
      expect(User.new(params)).to_not be_valid
      
    end

    it 'is invalid without email field' do

      params = { first_name: 'josh', last_name: 'kelly', email: nil, password: 'abc', password_confirmation: 'abc' }
      expect(User.new(params)).to_not be_valid
      
    end

  end

  describe '.authenticate_with_credentials' do

    it 'is invalid if nil or password is incorrect' do

      @user = User.create(first_name: 'josh', last_name: 'kelly', email: 'my@email.com', password: 'abc',  password_confirmation: 'abc')
      current_user = User.authenticate_with_credentials("my@email.com", 'efg')
      expect(current_user).to be_nil
    
    end
  
    it 'should return email if information is correct' do
      
      @user = User.create(first_name: 'josh', last_name: 'kelly', email: 'my@email.com', password: 'abc',  password_confirmation: 'abc')
      current_user = User.authenticate_with_credentials("my@email.com", "abc")
      expect(current_user.email).to eq(@user.email)

    end

    it 'should return email if information is correct with uppercase and downcase' do
      
      @user = User.create(first_name: 'josh', last_name: 'kelly', email: 'my@email.com', password: 'abc',  password_confirmation: 'abc')
      current_user = User.authenticate_with_credentials("MY@EMAIL.com", "abc")
      expect(current_user.email).to eq(@user.email)

    end

    it 'should return the user email if information is correct but with spaces around it' do
      
      @user = User.create(first_name: 'josh', last_name: 'kelly', email: 'my@email.com', password: 'abc',  password_confirmation: 'abc')
      current_user = User.authenticate_with_credentials(" my@email.com ", "abc")
      expect(current_user.email).to eq(@user.email)

    end

  end

end
