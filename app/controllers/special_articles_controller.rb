class SpecialArticlesController < ApplicationController
	def index
		@lol_text_articles = Article.where('text like ?', '%lol%')
		@oldest_articles = Article.first(2)
		@latest_articles = Article.last(2)
		@alphabet_title_articles = Article.order(:title)

	end

	private
		def special_article_params
			params.require(:article).permit(:title, :text)
		end
end
