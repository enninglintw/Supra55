class Record < ActiveRecord::Base
  belongs_to :identity
  belongs_to :org
  belongs_to :member
end
