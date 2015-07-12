class ChallengesController < ApplicationController

	def index
		@challenges = Challenge.all
	end

	def create
		@challenge = Challenge.new(challenge_params)
		@challenge.user = current_user
		if @challenge.save 
			redirect_to root_url
		end 
	end

	def new
		@challenge = Challenge.new
	end

	private
	def challenge_params
		params.require(:challenge).permit(:user_id, :title, :body, :language, :description)
	end
end
