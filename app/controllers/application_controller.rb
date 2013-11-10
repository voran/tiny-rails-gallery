class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def browse
    @entry =  params[:dir] || ""
    @output = find_entries(Rails.public_path + Rails.configuration.thumbnails_url + @entry)
    
    respond_to do |format|
      format.html { render }
      format.json { render :json => @output}
      format.xml {render :xml => @output.to_xml(:root => 'output')}
    end
  end
  
  def find_entries(entry_path)
    files = Array.new
    subdirs = Array.new
    Dir.foreach(entry_path) do |subentry|
      subentry_path = entry_path + '/' + subentry
      if File.directory?(subentry_path) and !Rails.configuration.blacklist_dirs.include? subentry
        subdirs.push(subentry)
      elsif File.file?(subentry_path) and Rails.configuration.whitelist_file_types.include? subentry.split('.')[-1].downcase
        files.push(subentry)
      end
    end
    return { :subdirs => subdirs.sort.reverse, :files => files.sort }
  end
end