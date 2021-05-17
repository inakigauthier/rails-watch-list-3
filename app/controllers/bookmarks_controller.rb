class BookmarksController < ApplicationController
    def new
        @bookmark = Bookmark.new
        @list = List.find(params[:list_id])
      end
    
      def create
        @bookmark = Bookmark.new(bookmark_params)
        @bookmark.list = List.find(params[:list_id])
        @bookmark.movie = Movie.find(params[:bookmark][:movie_id])
        if @bookmark.save
            redirect_to lists_path(@lists)
        else
          render :new
        end
      end
    
        def destroy
          @bookmark = Bookmark.find(params[:id])
          @bookmark.destroy
          redirect_to list_path(@bookmark.list)
        end
    
     private
    
      def bookmark_params
        params.require(:bookmark).permit(:comment)
      end
end
