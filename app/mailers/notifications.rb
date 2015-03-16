class Notifications < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.new_comment.subject
  #
  def new_comment(comment)
    @greeting = "Hi"
    @comment_id = comment.id
    @commenter_id = comment.user_id

    # @commented_article = Article.find(comment.article_id)
    @article = Article.find(comment.article_id)
    @article_title = @article.title
    @author_id = @article.user_id

    logger.debug "Inside notifications.rb"
    logger.debug "commenter_id: #{@commenter_id}"
    logger.debug "author_id: #{@author_id}"


    @author_email = User.find(@author_id).email

    logger.debug "#{@author_email}"
    

    mail to: @author_email
  end
end
