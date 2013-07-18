module TestImage
  class Setup
	  def grab_test_file(id)
	    path = "#{Rails.root.join('public/test_images')}/#{id}/"
	    file_name = Dir.entries("#{path}").last
	    the_file = File.open(path + file_name)
	    the_file
	  end

  end

end