class CommentsController < ApplicationController

	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(comment_params)
		@comment.user_id = current_user.id
		
		logger.debug "Creating new comment"
		logger.debug "#{@comment.user_id}"
		logger.debug "#{@comment.commenter}"
		logger.debug "#{@comment.body}"

		if @comment.save
			logger.debug "Saving new comment"
			Notifications.new_comment(@comment).deliver_now
		end

		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)
	end

	private
		def comment_params 
			params.require(:comment).permit(:commenter, :body)
		end
end
