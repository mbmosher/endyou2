class VersesController < ApplicationController

def new
	@verse = Verse.new
end

def index
	@showUnlock = false
	@verses = Verse.all
	@verses.each do |verse|
		if verse.unlocked == false
			verse.text = 'xxxxx'
			@showUnlocked = true
		end
	end
end

def create
	testverse = Verse.new(params[:verse].permit(:code))
	@verse = Verse.find_by code: testverse.code
	if @verse
		@verse.unlocked = true
		@verse.save
		# redirect_to verses_path
	else
		flash[:notice] = "Invalid code"
		# render 'unlock'
	end
	redirect_to verses_path
end

=begin

def unlock

end

def checkcode
	testverse = Verse.new(params[:verse].permit(:code))
	@verse = Verse.find_by code: testverse.code
	if @verse
		@verse.unlocked = true
		@verse.save
		# redirect_to verses_path
	else
		flash[:notice] = "Invalid code"
		# render 'unlock'
	end
	render 'index'
end

=end

end
