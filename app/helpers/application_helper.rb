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
   
   def random_cover(dir)
     base_path = "/data/Thumbs"
     files = Dir.glob(base_path + dir + "**/*.jpg", File::FNM_CASEFOLD)
     random_image = files.sample
     return (if random_image.nil? then "nil" else Pathname.new(random_image).relative_path_from(Pathname.new(base_path)) end)
   end
   
end
