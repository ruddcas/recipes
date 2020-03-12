class ChefsController < ApplicationController

	def index
		Chef.all
	end

	def new
		@chef = Chef.new
	end

	def create
		@chef = Chef.new(chef_params)
		if @chef.save
			flash[:success] = "Welcome #{@chef.chefsname} to Eascipes App!"
			redirect_to chef_path(@chef)
		else
			render 'new'
		end
	end

	def show
		@chef = Chef.find(params[:id])
	end

	

	private

	def chef_params
		params.require(:chef).permit(:chefsname, :email, :password, :password_confirmation)
	end
	
end
