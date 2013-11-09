module ApplicationHelper
  
  def urlencode(entry)
    entry_urlencoded = ""
    if !entry.nil?
      entry.split('/').each do | url_chunk |
        entry_urlencoded += URI::encode(url_chunk) + '/'
      end
    end
    return entry_urlencoded
  end
   
   def random_cover(dir)
     files = Dir.glob(Rails.public_path + Rails.configuration.thumbnails_url + dir + "/**/*.jpg", File::FNM_CASEFOLD)
     random_image = files.sample
     return (if random_image.nil? then nil else "/" + Pathname.new(random_image).relative_path_from(Pathname.new(Rails.public_path)).to_s end)
   end
end
