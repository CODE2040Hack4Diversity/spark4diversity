require 'hacker_rank_client'
class ChallengesController < ApplicationController
   before_filter :authenticate_user!

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

	def show
		@challenge = Challenge.find(params[:id])
	end

	def new
		@challenge = Challenge.new
	end

	def update
		client = HackerRankClient.new
<<<<<<< HEAD
    	response = client.submit_code(params[:challenge]["body"], "5", '["1"]')

    	pp "HERE!!"
    	pp response.handled_response[:message]
		redirect_to root_url
=======
		response = client.submit_code(Challenge.find(params[:id]).body, 5, '["1"]')
	  	redirect_to show
>>>>>>> b6811eb417ce29fb981d1d3babdbc25abe27d7bd
	end

	private
	def challenge_params
		params.require(:challenge).permit(:user_id, :title, :body, :language, :description, :answer)
	end
end
