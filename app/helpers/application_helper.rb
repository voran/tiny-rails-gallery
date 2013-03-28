module ApplicationHelper
  
  def urlencode(entry)
    if !entry.nil?
      entry_urlencoded = ""
      entry.split('/').each do | url_chunk |
        entry_urlencoded  =  entry_urlencoded  + URI::encode(url_chunk) + '/'
       end
     end
     return entry_urlencoded
   end
   
end
