class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery
  
  def browse
    files = Array.new
    subdirs = Array.new
    
    @entry =  (if params[:dir].nil?  then "" else params[:dir] end)
    @entry_urlencoded = urlencode(@entry)
    @photos_root = "/data/Photos"
    @thumbs_small_root = "/x150/Photos/"

    
    Dir.foreach(@photos_root + '/' + @entry) do |subentry|
      subentry_fullpath = @photos_root + '/' + @entry + '/' + subentry
      if File.directory?(subentry_fullpath) and subentry != '.' and subentry != '..'
        subdirs.push(subentry)
      elsif File.file?(subentry_fullpath) and ["jpg", "jpeg", "png", "gif", "bmp"].include? subentry.split('.')[-1].downcase
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