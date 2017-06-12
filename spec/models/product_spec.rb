require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'will save successfully with all four fields' do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      productOne = cat1.products.create({
        name:  'Men\'s Classy shirt',
        description: Faker::Hipster.paragraph(4),
        quantity: 0,
        price: 64.99
      })
      expect(productOne).to be_valid
    end

    it 'should not be valid without a name' do
      cat1 = Category.create!(name: 'Apparel')
      productOne = cat1.products.create({
        name:  nil,
        description: Faker::Hipster.paragraph(4),
        quantity: 0,
        price: 64.99
      })
      expect(productOne.errors.full_messages).to include("Name can't be blank")
    end

    it 'should not be valid without a price' do
      cat1 = Category.create!(name: 'Apparel')
      productOne = cat1.products.create({
        name:  'Shirt',
        description: Faker::Hipster.paragraph(4),
        quantity: 0,
        price: nil
      })
      expect(productOne.errors.full_messages).to include("Price can't be blank")
    end

    it 'should not be valid without a quantity' do
      cat1 = Category.create!(name: 'Apparel')
      productOne = cat1.products.create({
        name:  'shirt',
        description: Faker::Hipster.paragraph(4),
        quantity: nil,
        price: 64.99
      })
      expect(productOne.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should not be valid without a category' do
      productOne = Product.create({
        name:  'shirt',
        description: Faker::Hipster.paragraph(4),
        quantity: 0,
        price: 64.99
      })
      expect(productOne.errors.full_messages).to include("Category can't be blank")
    end
  end
end


# cat1 = Category.find_or_create_by! name: 'Apparel'
# cat2 = Category.find_or_create_by! name: 'Electronics'
# cat3 = Category.find_or_create_by! name: 'Furniture'


