class Talkroom < ActiveRecord::Base

	has_many :messages

	belongs_to :requester, class_name: 'User', :foreign_key => 'requester_id'
	belongs_to :accepter, class_name: 'User', :foreign_key => 'accepter_id'

end
