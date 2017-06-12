require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation' do
    it 'will save successfully when all valid fields are filled' do
      user = User.create({ first_name: 'pepper',
                            last_name: 'fancypants',
                            email: 'cat@example.com',
                            password: 'asdfg',
                            password_confirmation: 'asdfg' })
      expect(user).to be_valid
    end

    it 'is not valid when password and password confirmation fields do not match' do
      user = User.create( first_name: 'pepper',
                          last_name: 'fancypants',
                          email: 'cat@example.com',
                          password: 'asdfgh',
                          password_confirmation: 'asdfg' )
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'is not valid when password field is empty' do
      user = User.create( first_name: 'pepper',
                          last_name: 'fancypants',
                          email: 'cat@example.com',
                          password: nil,
                          password_confirmation: 'asdf' )
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it 'is not valid when password confirmation field is empty' do
      user = User.create( first_name: 'pepper',
                          last_name: 'fancypants',
                          email: 'cat@example.com',
                          password: 'asdfg',
                          password_confirmation: nil )
      expect(user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it 'is valid when email is unique' do
      user1 = User.create( first_name: 'pepper',
                          last_name: 'fancypants',
                          email: 'cat@example.com',
                          password: 'asdfgh',
                          password_confirmation: 'asdfgh' )
      user2 = User.create( first_name: 'pepper1',
                          last_name: 'fancypants123',
                          email: 'cat@example.com',
                          password: 'asdfgh',
                          password_confirmation: 'asdfgh' )
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'is not valid when email is empty' do
      user1 = User.create( first_name: 'pepper',
                          last_name: 'fancypants',
                          email: nil,
                          password: 'asdfgh',
                          password_confirmation: 'asdfgh' )
      expect(user1.errors.full_messages).to include("Email can't be blank")
    end

    it 'is not valid when first name is empty' do
      user1 = User.create( first_name: nil,
                           last_name: 'fancypants',
                           email: 'cat@example.com',
                           password: 'asdfgh',
                           password_confirmation: 'asdfgh' )
      expect(user1.errors.full_messages).to include("First name can't be blank")
    end

    it 'is not valid when last name is empty' do
      user1 = User.create( first_name: 'pepper',
                           last_name: nil,
                           email: 'cat@example.com',
                           password: 'asdfgh',
                           password_confirmation: 'asdf' )
      expect(user1.errors.full_messages).to include("Last name can't be blank")
    end

  describe '.authenticate_with_credentials' do
    it 'should validate when password and email matches with database' do
      user1 = User.create!( first_name: 'pepper',
                           last_name: 'fancypants',
                           email: 'cat@example.com',
                           password: 'asdfg',
                           password_confirmation: 'asdfg' )
      session = User.authenticate_with_credentials('cat@example.com', 'asdfg')
      expect(session).to eq user1
    end

    it 'should not validate when password and email do not match database' do
      user1 = User.create!( first_name: 'pepper',
                            last_name: 'fancypants',
                            email: 'cat@example.com',
                            password: 'asdfg',
                            password_confirmation: 'asdfg' )
      session = User.authenticate_with_credentials('catsareawesome@example.com', 'asdfgh')
      expect(session).to_not eq user1
    end

    it 'should validate email when a user adds a space in the field that matches an email in database' do
      user1 = User.create!( first_name: 'pepper',
                            last_name: 'fancypants',
                            email: 'cat@example.com',
                            password: 'asdfg',
                            password_confirmation: 'asdfg' )
      session = User.authenticate_with_credentials('cat@example.com ', 'asdfg')
      expect(session).to eq user1
    end

    it 'should validate email when a user uses lower or uppercase letters for an email in database' do
      user1 = User.create!( first_name: 'pepper',
                            last_name: 'fancypants',
                            email: 'cat@example.com',
                            password: 'asdfg',
                            password_confirmation: 'asdfg' )
      session = User.authenticate_with_credentials('CaT@example.com ', 'asdfg')
      expect(session).to eq user1
    end
  end

  end
end
