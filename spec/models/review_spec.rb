require 'rails_helper'

describe Review do

  it { should belong_to (:product) }
  it { should validate_presence_of :author }
  it { should validate_presence_of :content_body }
  it { should validate_length_of :content_body }
  it { should validate_presence_of :rating }
  it { should validate_numericality_of(:rating).is_greater_than(0) }
  it { should validate_numericality_of(:rating).is_less_than(5) }

end
