class Room < ActiveRecord::Base
  belongs_to :user
  has_many :reviews, :dependent => :destroy
  has_many :reviewed_rooms, :through => :reviews, :source => :room

  validates_presence_of :title, :location, :description

  def complete_name
    "#{title}, #{location}"
  end
end
