require 'rails_helper'

RSpec.feature "Visitor navigates to product detail page", type: :feature, js: true do

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

  scenario "They see details of one product" do
    # ACT
    visit root_path

    first('article.product').find_link('Details').click

    # DEBUG / VERIFY

    save_screenshot "1.png"

    expect(page).to have_css 'article.product-detail'
  end

end