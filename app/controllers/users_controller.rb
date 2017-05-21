class UsersController < ApplicationController

	def index
		if user_signed_in?
			# ログインユーザー情報
			@user = current_user
			# 友達一覧(トークルーム一覧)
			@friend_rooms = @user.requester_talkrooms.where(accepted: true).includes(:accepter) + @user.accepter_talkrooms.where(accepted: true).includes(:requester)
			#　友達リクエスト一覧
			@requests = @user.accepter_talkrooms.where(accepted: false).includes(:requester)
			
			# ユーザー検索機能
			@q = User.search(params[:q])
    		@accounts = @q.result if params[:q]!=nil
    	end
	end

	private
	def search_params
		params.require(:q).permit(:name_cont)
	end
end
