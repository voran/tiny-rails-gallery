# Tiny Rails Gallery

[![Code Climate](https://codeclimate.com/github/voran/tiny-rails-gallery.png)](https://codeclimate.com/github/voran/tiny-rails-gallery)

- [Description](#description)
- [Installation](#installation)
- [Configuration](#configuration)
    - [Title and Meta Tags](#title-and-meta-tags)
    - [Content](#content)
    - [Google Analytics](#google-analytics)
- [License](#license)
- [Credits](#credits)



## Description
Tiny Rails Gallery aims to be fast and minimalistic. It requires no database to run, but instead craws a pre-configured folder to find photos and thumbnails.
No database updates. Generating thumbnails is outside the scope of this project.
To generate scaled-down versions of images for fullscreen display and thumbnails, you are advised to use a fast, third-party tool such as ImageMagick directly from the command line.

## Installation
Clone this repository. Then:
```sh
bundle install
```

## Configuration
Configuration for this application is stored in config/application.rb

### Title and Meta Tags
You can set title and meta tags using the following entries:
```rb
    config.title = "My Web Gallery | Tiny Rails Gallery"
    config.meta_description = "Powered by Tiny Rails Gallery"
    config.meta_keywords = "Gallery"
```

### Content
Pictures and thumbnails need to be in folders accessible under public/. You can also set up symlinks that point to folders outside the web application.
```rb
    config.photos_url = "/photos/"
    config.thumbnails_url = "/thumbnails/"
```
 to the folders (or symlinks) where your content is.
 
 Tiny Rails Gallery walks the thumbnails folder and picks a random image to use as thumbnail for each folder. If no images are found in a folder and its


Also, You can whitelist file types and blacklist directories using the following entries:
```rb
    config.blacklist_dirs = [".", ".."]
    config.whitelist_file_types = ["jpg", "jpeg", "png", "gif", "bmp"]
```

### Google Analytics
To enable google analytics for your new gallery, put your Google Analytics code in config/environments/production.rb"
```rb
    # Enable Google Analytics
    GA.tracker = "<your GA Code here>"
```

## License
Released under the [GPL 3 License](http://www.gnu.org/licenses/gpl.txt).

## Credits
The JavaScript image preview is based on  [blueimp/Gallery](https://github.com/blueimp/Gallery/) JS library.
Layout based on  [twitter/bootstrap](https://github.com/twitter/bootstrap).
    
