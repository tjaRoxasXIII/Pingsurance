class Lead < ApplicationRecord
    validates :first_name, :last_name, presence: true

    def full_name
        return self.first_name + " " + self.last_name
    end

    # Method should only be called on un-formatted numbers during Lead creation
    def format_phone_number
        area_code = self.phone_number.slice!(0,3)
        area_code = '(' + area_code + ') '
        return area_code + self.phone_number.insert(3, '-')
    end
end
