class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def browse
    files = Array.new
    subdirs = Array.new
    
    @entry = params[:dir]
    @photos_root = "/data/Photos"
    @thumbs_root = "/data/Thumbs/x150/Photos"
    @views_root = "/data/Thumbs/x800/Photos"
    @fulscreen_root = "/data/Thumbs/x1080/Photos"
    

    if  @entry.nil? or (!File.directory?(@photos_root + '/' + @entry) and !File.file?(@photos_root + '/' + @entry))
      @entry = ""    
    elsif File.file?(@photos_root + '/' + @entry)
      send_file @photos_root + '/' + @entry
      return
    end
    
    Dir.foreach(@photos_root + '/' + @entry) do |subentry|
      subentry_fullpath = @photos_root + '/' + @entry + '/' + subentry
      if File.directory?(subentry_fullpath) and subentry != '.' and (subentry != '..' or !params[:dir].nil?)
        subdirs.push(subentry)
      elsif File.file?(subentry_fullpath) and ["jpg", "jpeg", "png", "gif", "bmp"].include? subentry.fullpath.split('.')[-1].lower
        files.push(subentry)
      end
    end
    
    @output = { :subdirs => subdirs.sort, :files => files.sort }
    
    respond_to do |format|
      format.html { render }
      format.json { render :json => @output}
      format.xml {render :xml => @output.to_xml(:root => 'output')}
    end
  end
end