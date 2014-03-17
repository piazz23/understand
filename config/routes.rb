Rails.application.routes.draw do
	get '/understand/dashboard' => 'understand/requests#index' , :as => :understand

	get '/understand/requests/parse_tmp_files' => 'understand/requests#parse_tmp_files', as: :understand_parse_tmp_files

	delete '/understand/requests/delete_all' => 'understand/requests#delete_all', as: :understand_delete_all_requests	
end