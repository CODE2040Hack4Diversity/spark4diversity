require 'hacker_rank_client'
class ChallengesController < ApplicationController
   before_filter :authenticate_user!

	def index
		@challenges = Challenge.all.reverse_order()
	end

	def create
		@challenge = Challenge.new(challenge_params)
		@challenge.user = current_user
		if @challenge.save
			redirect_to root_url
		end
	end

	def show
		@challenge = Challenge.find(params[:id])
	end

	def new
		@challenge = Challenge.new
	end


	def destroy
		@challenge = Challenge.find(params[:id])
		@challenge.destroy
		redirect_to root_url
	end

	def update
		client = HackerRankClient.new
    	response = client.submit_code(params[:challenge]["body"], "5", '["144\n"]')

    	pp response.handled_response[:message]
		redirect_to root_url
	end

	private
	def challenge_params
		params.require(:challenge).permit(:user_id, :title, :body, :language, :description, :answer)
	end
end
