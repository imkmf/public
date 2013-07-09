require "public/version"
require "fileutils"
require "clipboard"

GEM_DIRECTORY = File.dirname(__FILE__)
CONFIG = "#{ Dir.home }/.public_gem"

class Public
  def self.config
    file = setup
    get_id(file)
  end

  def self.setup
    if File.file?(CONFIG)
      file = File.read(CONFIG)
      get_id(file)
      if @user_id == "CHANGE_ME"
        change_me
      else
        puts "Already configured with a Dropbox ID of #{ @user_id }"
        puts "Try copying a file with 'public <FILE>'"
      end
    else
      not_configured
    end
    file
  end

  def self.not_configured
    FileUtils.cp "#{ GEM_DIRECTORY }/.public_gem", CONFIG
    file = File.read(CONFIG)
    change_me
    file
  end

  def self.get_id(file)
    @user_id = file.split(": ").last.chomp unless file.nil?
  end

  def self.process(file)
    unless File.file?(CONFIG)
      not_configured
    else
      if File.file?(file)
        move_file(file)
      else
        puts "That file doesn't exist!"
      end
    end
  end

  def self.move_file(file)
    dropbox_location = "#{ Dir.home }/Dropbox/Public/"
    FileUtils.cp file, dropbox_location
    copy_link(file)
  end

  def self.copy_link(file)
    get_id(File.read(CONFIG))
    if @user_id == "CHANGE_ME"
      change_me
    else
      dropbox_url = "https://dl.dropboxusercontent.com/u/#{ @user_id }/#{ file }"
      Clipboard.copy(dropbox_url)
      puts dropbox_url
      puts "Copied to clipboard."
    end
  end

  def self.change_me
    puts "Your config file is located at '~/.public_gem'"
    puts "Please replace the default value with your Dropbox ID."
    puts "(You can find this in a Dropbox public URL: "
    puts "dl.dropboxusercontent.com/u/YOUR_ID/foobar.zip)"
  end
end
