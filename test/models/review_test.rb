require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  def setup
  	@review = Review.new(comment: "Great!", star: '1', room:'one', user: 'one')
  end 
end
