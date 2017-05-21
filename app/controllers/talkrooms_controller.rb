class TalkroomsController < ApplicationController

	before_action :move_to_users_index, only: [:index]

	def index
		@room = Talkroom.find(params[:room_id])
		if current_user.id==@room.requester.id
			@friend = User.find(@room.accepter.id)
		else
			@friend = User.find(@room.requester.id)
		end

		# 既読をつける
		not_yet = @room.messages.where(sender: @friend.id).where(read: false)
		if not_yet != nil
			not_yet.each do |message|
				message.update(read: true)
			end
		end
	end

	def new
		@account = User.find(params[:accepter_id])
	end

	def create
		Talkroom.create(requester_id: current_user.id, accepter_id: params[:accepter_id], accepted: false)	
	end

	def edit
		@request_room = Talkroom.find(params[:room_id])
	end

	def update
		@request_room = Talkroom.find(params[:room_id])
		@request_room.update(accepted: true)
	end


	private
	def move_to_users_index
		room = Talkroom.find(params[:room_id])
    	redirect_to controller: :users, action: :index unless current_user.id == room.requester_id || current_user.id == room.accepter_id
  	end

end
