# class SearchesController < ApplicationController
# 	def search
# 			@model = params[:model]
# 			@content = params[:content]
# 			@method = params[:method]
# 			if @model == 'brand'
# 				@records = Brand.search_for(@content, @method)
# 			end
# 			@brands = Brand.all.page(params[:page]).per(9)
# 	end
# end