class VersesController < ApplicationController
   http_basic_authenticate_with name: "mbmosher", password: "46k2ll", except: [:index, :unlock, :checkcode]

def new
	@verse = Verse.new
end

def index
	@showUnlocked = false
	@verses = Verse.all.order(:id)
	@verses.each do |verse|
		if verse.unlocked == false
			verse.text = '
			Xxxx xxxx 
			Xxxxxx xx xxxxxxxx
			Xxx xxxxxxxx xx xx xxxxxx xxx
			Xxxxxxxxxx xxxxxx
			'
			@showUnlocked = true
		end
	end
end

def create
  @verse = Verse.new(verse_params)
  @verse.unlocked = false
  @verse.save

	redirect_to verses_path
end


def unlock
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
  redirect_to verses_path
end

def verse_params
	params.require(:verse).permit(:text, :code, :image, :map, :latitude, :longitude, :imagelink, :maplink)
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
