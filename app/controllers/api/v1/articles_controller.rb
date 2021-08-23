# frozen_string_literal: true

module Api
  module V1
    class ArticlesController < ApiController
      def index
        @articles =
          Article
          .eager_load([:comments])
          .all

        @articles = apply_pagination_and_sort('articles', @articles)

        @total_count = @articles.count
      end

      def show
        @article = Article.find(params[:id])
      end

      def create
        @article = Article.new(article_params)

        if @article.save
          redirect_to @article
        else
          render :new
        end
      end

      def update
        @article = Article.find(params[:id])

        if @article.update(article_params)
          redirect_to @article
        else
          render :edit
        end
      end

      def destroy
        @article = Article.find(params[:id])
        @article.destroy

        redirect_to root_path
      end

      private

      def article_params
        params.require(:article).permit(:_order, :_sort, :title, :body, :status)
      end
    end
  end
end
