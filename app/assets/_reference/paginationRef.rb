def list
	# set needed variables
	page = (params[:page] ||= 1).to_i
	items_per_page = 10
	offset = (page - 1) * items_per_page
	
	# get a count of all items instead of a find
	
	
	# create a Paginator
	# 
end