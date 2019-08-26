require 'rails_helper'

describe "product routes testing", {:type => :feature} do

  it "visits the products page" do
    visit products_path
    expect(page).to have_content "Products"
    expect(page).to have_content "Add a new product"
  end

  it "creates a new product" do
    visit new_product_path
    fill_in('Name', :with => 'shortsword')
    fill_in('Cost', :with => 45)
    fill_in('Country of origin', :with => 'USA')
    click_button('Create Product')
    expect(page).to have_content('Product was successfully added to the list!')
  end

  it "updates a product" do
    test_product = Product.new({:name => 'Super Kukri', :cost => 45, :country_of_origin => 'Turkey'})
    test_product.save
    product_id = test_product.id.to_i
    visit "/products/#{test_product.id}/edit"
    fill_in('Name', :with => 'shortsword')
    fill_in('Cost', :with => 45)
    fill_in('Country of origin', :with => 'USA')
    click_button('Update Product')
    expect(page).to have_content('Product was successfully updated!')
  end

  it "deletes a product" do
    test_product = Product.new({:name => 'Super Kukri', :cost => 45, :country_of_origin => 'Turkey'})
    test_product.save
    product_id = test_product.id.to_i
    visit "/products/#{test_product.id}"
    click_link('Delete product')
    page.accept_confirm { click_button "OK" }
    expect(page).to have_content('Product was successfully deleted!')
  end

end
