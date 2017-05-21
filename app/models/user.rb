class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :requester_talkrooms, class_name: 'Talkroom', :foreign_key => 'requester_id'
  has_many :accepter_talkrooms, class_name: 'Talkroom', :foreign_key => 'accepter_id'

  has_many :sender_messages, class_name: 'Message', :foreign_key => 'sender_id'
  has_many :receiver_messages, class_name: 'Message', :foreign_key => 'receiver_id'

end
