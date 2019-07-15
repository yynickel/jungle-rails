require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # test absence of required data fields
    it 'should not create user without a first name' do
      user=User.create last_name:'Doe', email:'a@a',password:'123', password_confirmation:'123'
      expect(user).to_not be_valid
    end
    it 'should not create user without a last_name' do
      user=User.create first_name:'John', email:'a@a',password:'123', password_confirmation:'123'
      expect(user).to_not be_valid
    end
    it 'should not create user without an email' do
      user=User.create first_name:'John', last_name:'Doe', password:'123', password_confirmation:'123'
      expect(user).to_not be_valid
    end
    it 'should not create user without a password or password confirmation' do
      user=User.create first_name:'John', last_name:'Doe', email:'a@a'
      expect(user).to_not be_valid
    end

    #test password and email formatting
    it 'should not create user without a matching password' do
      user=User.create first_name:'John', last_name:'Doe', email:'a@a',password:'123', password_confirmation:'321'
      expect(user).to_not be_valid
    end
    it 'should not create user with an incorrectly formatted email' do
      user=User.create first_name:'John', last_name:'Doe', email:'abc',password:'123', password_confirmation:'123'
      expect(user).to_not be_valid
    end
    it 'should not create user with an email that is already taken' do
      user1=User.create first_name:'John', last_name:'Doe', email:'a@a',password:'123', password_confirmation:'123'
      user2=User.create first_name:'John', last_name:'Doe', email:'A@A',password:'123', password_confirmation:'123'
      expect(user2).to_not be_valid
    end
    it 'should not create user with a password less than 3 characters' do
      user=User.create first_name:'John', last_name:'Doe', email:'a@a',password:'12',password_confirmation:'12'
      expect(user).to_not be_valid
    end
    # positive case
    it 'should create user with proper attribute' do
      user=User.create first_name:'John', last_name:'Doe', email:'a@a',password:'123',password_confirmation:'123'
      expect(user).to be_valid
    end

  end
end
