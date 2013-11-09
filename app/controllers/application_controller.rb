class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery
  
  def browse
    files = Array.new
    subdirs = Array.new
    
    @entry =  params[:dir] || ""
    
    entry_path = Rails.public_path + Rails.configuration.thumbnails_url + @entry
    Dir.foreach(entry_path) do |subentry|
      subentry_path = entry_path + '/' + subentry
      if File.directory?(subentry_path) and !Rails.configuration.ignore_dirs.include? subentry
        subdirs.push(subentry)
      elsif File.file?(subentry_path) and Rails.configuration.valid_file_types.include? subentry.split('.')[-1].downcase
        files.push(subentry)
      end
    end

    @output = { :subdirs => subdirs.sort.reverse, :files => files.sort }
    
    respond_to do |format|
      format.html { render }
      format.json { render :json => @output}
      format.xml {render :xml => @output.to_xml(:root => 'output')}
    end
  end
end