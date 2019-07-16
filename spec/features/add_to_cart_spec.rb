require 'rails_helper'

RSpec.feature "Visitor add item to cart", type: :feature, js: true do

  # SETUP
  before :each do
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

  scenario "They add one item to cart, changing to My Cart (1)" do
    # ACT
    visit root_path

    first('article.product').find_button('Add').click

    # DEBUG / VERIFY

    save_screenshot "1.png"

    expect(page.find('#navbar')).to have_link 'My Cart (1)'
  end

end