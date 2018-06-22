post '/wall/index' do
  @search_string = params[WoSo]
  @results = TwitterAdapter::search(@search_string)
  erb :"/tweets/index.html"
end
