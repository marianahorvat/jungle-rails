require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # Validation tests/examples here 
    category = Category.create! name: 'Electronics'
    product = category.products.create!({
      name: 'Hotdog Slicer',
      description: 'Normcore gluten-free.',
      image: 'electronics2.jpg',
      quantity: 3,
      price_cents: 26
    })
    it 'should create a new product successfully' do
      expect(product).to be_valid
    end
    it 'Should have a name' do
      product.name = nil
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Name can't be blank")
    end
    it 'Should have a price' do
      product.price_cents = nil
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Price can't be blank")
    end
    it 'Should have a quantity' do
      product.quantity = nil
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end
    it 'Should have a category' do
      product.category_id = nil
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

  end
  # pending "add some examples to (or delete) #{__FILE__}"
end


