require 'rails_helper'

RSpec.feature "Visitor clicks on the 'Add to Cart' button and increases their cart by one", type: :feature, js: true do

  before :each do
    @user = User.create!(
      first_name: 'First',
      last_name: 'user',
      email: 'first@user.com',
      password: '123456',
      password_confirmation: '123456'
    )
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end
  scenario "Visitor increases their cart by one" do

    visit '/login'

    within 'form' do
      fill_in id: 'email', with: @user.email
      fill_in id: 'password', with: @user.password

      click_button 'Submit'
    end

    first('article.product').find_link('Add').click
    expect(page).to have_content 'My Cart (1)'
    save_screenshot 'cart.png'

  end
end
