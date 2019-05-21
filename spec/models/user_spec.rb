require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'Validations' do
    subject do
      user = User.new(
        first_name: 'Mary',
        last_name: 'Smith',
        email: 'mary@test.com',
        password: '123',
        password_confirmation: '123'
      )
    end
    it 'Should be created if all required fields are present' do
      expect(subject).to be_valid
    end
    it 'Should have a first name' do
      subject.first_name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("First name can't be blank")
    end
    it 'Should have a last name' do
      subject.last_name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Last name can't be blank")
    end
    it 'Should have a email' do
      subject.email = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Email can't be blank")
    end
    it 'Should have a password field' do
      subject.password = nil
      expect(subject).to_not be_valid
    end
    it 'Should have a password confirmation field' do
      subject.password = 'winter'
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
    end
    it 'Password and password confirmation should match' do
      subject.password_confirmation = 'snow'
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'emails should be unique' do
      user1 = User.create!({
        first_name: 'John',
        last_name: 'Doe',
        email: 'mary@test.com',
        password: 'pass1',
        password_confirmation: 'pass1'
      })
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Email has already been taken")
    end
    it 'Emails should be case insensitive' do
      user1 = User.create!({
        first_name: 'John',
        last_name: 'Doe',
        email: 'Mary@test.com',
        password: 'pass1',
        password_confirmation: 'pass1'
      })
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Email has already been taken")
    end
  end

end
