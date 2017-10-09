class Url < ActiveRecord::Base


	validates :long_url, presence: true, uniqueness: {case_sensitive: false, message: "was shortened before"}

  	validates :long_url, format: {with: (URI::regexp(['http', 'https'])), message: "format is not good"}


	def short

		array = ("0".."9").to_a + ("a".."z").to_a + ("A".."Z").to_a

		@short_url = []

		7.times do
			@short_url << array.sample
		end

		shorten = @short_url.join
		
    	return shorten
	end
end
