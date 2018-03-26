class Release < ActiveRecord::Base
  validates :name, presence: true
  validates :date, presence: true

  belongs_to :user

  #未発売のみ/発売済のみの絞り込み
  scope :passed, ->(pass){
    if pass.present?
      pass_bool = true
      if pass == "true"
        pass_bool = true
      else
        pass_bool = false
      end
      where('pass=?',pass_bool)
    end
  }

end
