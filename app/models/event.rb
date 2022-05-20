class Event < ApplicationRecord
    has_many :attendances
    has_many :users, through: :attendances
    belongs_to :admin, class_name:'User'


    validates :start_date, presence: true
    validate :start_is_futur?

    validates :duration, presence: true
    validate :is_multiple_of_5?

    validates :title, presence: true, length: { in: 5..140 }

    validates :description, presence: true, length: { in: 10..1000 }

    validates :price, presence: true, numericality: { only_integer: true, in: 1..1000}

    validates :location, presence: true


    def is_multiple_of_5?
        valid = self.duration.to_i%5 == 0
        errors.add(:duration, "duration must be a multiple of 5") unless valid
    end

    def start_is_futur?
        valid = self.start_date.to_i > Time.now.to_i
        errors.add(:start_date, "start_date must be in future") unless valid
    end

    
    #faire time_in_futur et multiple_of_5 > 0
end
