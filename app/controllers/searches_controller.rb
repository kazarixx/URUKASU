class SearchesController < ApplicationController
	def search
			@model = params[:model]
			@content = params[:content]
			@method = params[:method]
			if @model == 'brand'
				@records = Brand.search_for(@content, @method)
			end
	end
end
