class Lead < ApplicationRecord

    def full_name
        return self.first_name + " " + self.last_name
    end
end
