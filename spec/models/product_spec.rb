require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:all) do
    @cat=Category.create name:'some category'
  end
  describe 'Validations' do
    it 'should not create product without a name' do
      product=Product.create price: 2.99, quantity: 10, category: @cat
      puts product.errors.full_messages
      expect(product).to_not be_valid
    end
    it 'should not create product without a price' do
      product=Product.create name:'some product', quantity: 10, category: @cat
      puts product.errors.full_messages
      expect(product).to_not be_valid
    end
    it 'should not create product without a quantity' do
      product=Product.create name:'some product', price: 2.99, category: @cat
      puts product.errors.full_messages
      expect(product).to_not be_valid
    end
    it 'should not create product without a category' do
      product=Product.create name:'some product', price: 2.99, quantity: 10
      puts product.errors.full_messages
      expect(product).to_not be_valid
    end
    it 'should create product with proper attribute' do
      product=Product.create name:'some product', price: 2.99, quantity: 10, category: @cat
      puts product.errors.full_messages
      expect(product).to be_valid
    end

  end
end
