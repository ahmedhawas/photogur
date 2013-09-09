class PicturesController < ApplicationController
	
	def index
    @current_user = User.first
		@pictures = Picture.all
	end


  def show
    @current_user = User.first
    @picture = Picture.find(params[:id])
  end

  def new
  end

  def new
    @picture = Picture.new
  end

  def create
    # make a new picture with what picture_params returns (which is a method we're calling)
    @picture = Picture.new(params[:picture])
    if @picture.save 
      # if the save for the picture was successful, go to index.html.erb
      redirect_to pictures_url
    else
      # otherwise render the view associated with the action :new (i.e. new.html.erb)
      render :new
    end
  end

   def picture_params
     params.require(:picture).permit(:artist, :title, :url)
   end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])

    if @picture.update_attributes(params[:picture])
      redirect_to "/pictures/#{@picture.id}"
    else
    	#redirect_to "/pictures/#{@picture.id}/edit"
      	render :edit
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_url
  end

  def sort_by_date
  	@pictures = Picture.all
  	@pictures = Picture.order(:created_at)
  end

  def sort_by_title
  	@pictures = Picture.order(:title)
  end

  def like
    @current_user = User.first
    @picture = Picture.find(params[:id])

    if @current_user.flagged?(@picture, :like)
      #link_to "Unlike", like_picture_path(@picture)
       @current_user.unflag(@picture, :like)
       msg = "You now dont like this article"
    else
      #link_to "Like", like_picture_path(@picture) 
       @current_user.flag(@picture, :like)
       msg = "You now like this article"
    end
    redirect_to "/pictures/#{@picture.id}", :notice => msg
  end

end