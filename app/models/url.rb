#enter require here
require_relative '../../config/environments/init'
require 'securerandom'

class Url < ActiveRecord::Base
	before_create :shorty
	validates :long_url, presence: true, :format => {:with => URI.regexp}
	validates :short_url, uniqueness: true
	
	def shorty
		SecureRandom.urlsafe_base64(8)
	end

	def count
	    self.click_count += 1
	    self.save
	end
end

# def random_string(length)
#  	rand(36**length).to_s(36)
# end
