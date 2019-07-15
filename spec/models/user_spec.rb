require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should not create user without a first name' do
      user=User.create first_name:'John', last_name:'Doe', email:'a@a',password:'123'
      expect(user).to be_valid
    end
    it 'should not create user without a last_name' do
      user=User.create first_name:'John', last_name:'Doe', email:'a@a',password:'123'
      expect(user).to be_valid
    end
    it 'should not create user without an email' do
      user=User.create first_name:'John', last_name:'Doe', email:'a@a',password:'123'
      expect(user).to be_valid
    end
    it 'should not create user without a password' do
      user=User.create first_name:'John', last_name:'Doe', email:'a@a',password:'123'
      expect(user).to be_valid
    end

    it 'should create user with proper attribute and a unique email' do
      user=User.create first_name:'John', last_name:'Doe', email:'a@a',password:'123'
      expect(user).to be_valid
    end

  end
end
