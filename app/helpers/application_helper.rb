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
   
   def random_cover(base_path, dir)
     files = Dir.glob(base_path + dir + "/**/*.jpg", File::FNM_CASEFOLD)
     random_image = files.sample
     return (if random_image.nil? then base_path + dir + "/**/*.jpg" else Pathname.new(random_image).relative_path_from(Pathname.new(base_path)).to_s end)
     # return  base_path + dir + "**/*.jpg"
   end
   
end
