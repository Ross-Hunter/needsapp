class Need < ActiveRecord::Base
	has_many :slots

	#scope :not_expired, where(:datetime1 => Date.today..(Date.today + 1.year))
	scope :between, lambda{|start_date, end_date| where(datetime1: start_date..end_date)}


	accepts_nested_attributes_for :slots

	def self.search(search_string)
		words = search_string.split(' ')
    @needs = []
    words.each do |word|
      Need.where("title like '%#{word}%'").each do |need|
        @needs << need unless @needs.include?(need)
      end
    end
    @needs
	end

end
