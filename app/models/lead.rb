class Lead < ApplicationRecord
    validates :first_name, :last_name, presence: true
    
    def full_name
        return self.first_name + " " + self.last_name
    end
end
