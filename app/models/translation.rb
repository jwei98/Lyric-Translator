class Translation < ActiveRecord::Base
    include PublicActivity::Common
    validates :name, :presence => true
    validates :lyric, :presence => true
    validates :translation, :presence => true
    
    belongs_to :user
end
