module ApplicationHelper
  
  def urlencode(entry)
    entry_urlencoded = Array.new
    if !entry.nil?
      entry.split('/').each do | url_chunk |
        entry_urlencoded.push(URI::encode(url_chunk))
      end
    end
    return entry_urlencoded.join('/')
  end
   
   def random_cover(dir)
     patterns = Rails.configuration.whitelist_file_types.map { |type| Rails.configuration.public_path + Rails.configuration.thumbnails_url + dir + "/**/*." + type }
     files = Dir.glob(patterns, File::FNM_CASEFOLD)
     random_image = files.sample
     return (if random_image.nil? then nil else "/" + Pathname.new(random_image).relative_path_from(Pathname.new(Rails.configuration.public_path)).to_s end)
   end
end
