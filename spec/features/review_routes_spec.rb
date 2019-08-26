require 'rails_helper'

describe "review routes testing", {:type => :feature} do

  it "visits a product page with a review" do
    test_product = Product.new({:name => 'Super Kukri', :cost => 45, :country_of_origin => 'Turkey'})
    test_product.save
    product_id = test_product.id.to_i
    test_review = test_product.reviews.create({:author => "Bobby", :content_body => "I love this thing! It's the best knife, I have ever owned! Also, the site is great!", :rating => 4})
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

  it "visits a review edit page" do
    test_product = Product.new({:name => 'Super Kukri', :cost => 45, :country_of_origin => 'Turkey'})
    test_product.save
    product_id = test_product.id.to_i
    test_review = test_product.reviews.create({:author => "Bobby", :content_body => "I love this thing! It's the best knife, I have ever owned! Also, the site is great!", :rating => 4})
    test_product.save
    visit "/products/#{test_product.id}/reviews/#{test_review.id}/edit"
    expect(page).to have_content("I love this thing! It's the best knife, I have ever owned! Also, the site is great!")
  end

  it "updates a review" do
    test_product = Product.new({:name => 'Super Kukri', :cost => 45, :country_of_origin => 'Turkey'})
    test_product.save
    product_id = test_product.id.to_i
    test_review = test_product.reviews.create({:author => "Bobby", :content_body => "I love this thing! It's the best knife, I have ever owned! Also, the site is great!", :rating => 4})
    test_product.save
    visit "/products/#{test_product.id}/reviews/#{test_review.id}/edit"
    fill_in('Author', :with => "Bobby")
    fill_in('Content body', :with => "I hate this thing! It's the worst knife, I have ever owned! Also, the site is terrible!")
    fill_in('Rating', :with => 1)
    click_button('Update Review')
    expect(page).to have_content('Review was successfully updated!')
    expect(page).to have_content("I hate this thing! It's the worst knife, I have ever owned! Also, the site is terrible!")
  end

  it "Deletes a review" do
    test_product = Product.new({:name => 'Super Kukri', :cost => 45, :country_of_origin => 'Turkey'})
    test_product.save
    product_id = test_product.id.to_i
    test_review = test_product.reviews.create({:author => "Bobby", :content_body => "I love this thing! It's the best knife, I have ever owned! Also, the site is great!", :rating => 4})
    test_product.save
    visit "/products/#{test_product.id}/reviews/#{test_review.id}/edit"
    click_link("Delete review")
    expect(page).to_not have_content('Review was successfully deleted!')

  end

end
