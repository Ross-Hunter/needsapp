class Need < ActiveRecord::Base

  validates_presence_of :title, :date
  has_many :slots
  belongs_to :category, :foreign_key => :category_id

  #scope :not_expired, where(:datetime1 => Date.today..(Date.today + 1.year))
  scope :between, lambda{|start_date, end_date| where(date: start_date..end_date)}


  accepts_nested_attributes_for :slots

  def self.search(search_string)
    if search_string == ''
      @needs = Need.all
    else
      words = search_string.split(' ')
      @needs = []
      words.each do |word|
        Need.where("title like '%#{word}%'").each do |need|
          @needs << need unless @needs.include?(need)
        end
      end
    end
    @needs
  end

  def repeat(frequency, num_repeats)

    while num_repeats > 0
      duplicate = self.dup()
      duplicate.date = self.date + (frequency * num_repeats).days

      self.slots.each do |slot|
				new_slot = duplicate.slots.build()
				new_slot.note = slot.note
				new_slot.name = slot.name
      end

      num_repeats = num_repeats - 1
      duplicate.is_repeat = true
      duplicate.save
    end
  end


end
