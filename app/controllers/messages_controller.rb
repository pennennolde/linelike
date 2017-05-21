class MessagesController < ApplicationController

	before_action :move_to_users_index

	def create
		room = Talkroom.find(message_params[:id])
		if room.requester.id == current_user.id
			receiver_id = room.accepter.id
		else
			receiver_id = room.requester.id
		end
		Message.create(message: message_params[:message], talkroom_id: room.id, sender_id: current_user.id, receiver_id: receiver_id, read: 0)
		redirect_to controller: :talkrooms, action: :index, room_id: room.id
	end


	private
    def message_params
    	params.permit(:message, :id)
    end

	def move_to_users_index
		room = Talkroom.find(message_params[:id])
    	redirect_to controller: :users, action: :index unless current_user.id == room.requester_id || current_user.id == room.accepter_id
  	end

end
