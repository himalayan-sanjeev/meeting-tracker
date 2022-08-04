class Meeting < ApplicationRecord
  belongs_to :user

  enum status: { upcoming: 0, ongoing: 1, completed:2, cancled:3 }
end
