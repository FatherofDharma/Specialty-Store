require 'rails_helper'

describe "review routes testing", {:type => :feature} do

  it "visits a product page with a review" do
    test_product = Product.new({:name => 'Super Kukri', :cost => 45, :country_of_origin => 'Turkey'})
    test_product.save
    product_id = test_product.id.to_i
    rest_review = test_product.reviews.create({:author => "Bobby", :content_body => "I love this thing! It's the best knife, I have ever owned! Also, the site is great!", :rating => 4})
    test_product.save
    visit "/products/#{test_product.id}"
    expect(page).to have_content("I love this thing! It's the best knife, I have ever owned! Also, the site is great!")
  end

  it "creates a review" do
    test_product = Product.new({:name => 'Super Kukri', :cost => 45, :country_of_origin => 'Turkey'})
    test_product.save
    product_id = test_product.id.to_i
    visit "/products/#{test_product.id}"
    click_link('Add a review')
    fill_in('Author', :with => "Bobby")
    fill_in('Content body', :with => "I love this thing! It's the best knife, I have ever owned! Also, the site is great!")
    fill_in('Rating', :with => 4)
    click_button('Create Review')
    expect(page).to have_content("Review was successfully created!")
  end

end
