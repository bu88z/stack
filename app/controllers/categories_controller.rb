class CategoriesController < ApplicationController
	
	# i want to run get_category before the show, edit, udate, destroy
	# i don't want to keep having to repeat the same code over and over
	# we can use before_action to do theings befor any method (a.k.a. action)

	before_action :get_category, only: [:show, :edit, :update, :destroy]

	# step number 2 is to add in a index page
	# we want to define the index of our controller
	def index
		#this is where all of our code for the index page lives
		@categories = Category.all.order("rank desc, name asc")
	end

	def show
		# @category is now in get_category method that runs before this action
	end

	#the new form for a category
	def new
		@category = Category.new
	end

	#actually add the category using the data the form has in it
	def create
		@category = Category.new(category_params)

		if @category.save
			flash[:success] = "Category added"
			
			# go back to homepage
			redirect_to root_path
		
		else
			
			# fi the category does NOT save
			# i want to show the form again but with some errors

			# we've already got the view that we want to show to the user
			# this is the new.html.erb
			render "new"

		end

		

		
	end

	#get a form to edit this category
	def edit
		# @category is in get_category
	end

	# actually update the row in the database
	def update
		# find the category, just like the show action (find from url)
		#@category = Category.find(params[:id])

		# get_category not needed anymore

		#update based on the secure form data from below
		

		if @category.update(category_params)
			
			flash[:success] = "Category Updated"
			
			#redirect to the home page
			redirect_to root_path

		else
			
			# show the edit form if it doesn't update
			# edit.html.erb in our views
			render :edit #could also be in quotes 

		end

		

		

		
	end

	# actually delete the category in the database
	def destroy
		# function call
		# get_category not needed anymore

		# destroy that row
		@category.destroy

		# tell the user they've deleted this category
		flash[:success] = "Category deleted"

		# go back to the home page
		redirect_to root_path

	end

	# to not repeat ourseves, lets create a brand new method to simplify things
	# i can call a method whatever i like
	def get_category
		@category = Category.find(params[:id])
	end

	# whitelist all of the form data
	# make sure we are secure from hackers
	def category_params
		params.require(:category).permit(:name, :rank)
	end
end
