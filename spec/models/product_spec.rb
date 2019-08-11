require 'rails_helper'

describe Product do

  it { should have_many (:reviews) }

  # it { should validate_presence_of :name }

end
