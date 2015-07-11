class ChallengesController < ApplicationController

	def index
		@challenges = Challenge.all
	end

	def create
		Challenge.create(challenge_params)
	end

	def new
		@challenge = Challenge.new
	end

	private
	def challenge_params
		params.require(:challenge).permit(:user_id, :title, :body, :language, :description)
	end
end
