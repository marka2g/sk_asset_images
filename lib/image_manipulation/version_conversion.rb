module ImageManipulation
  class VersionConversion
      require 'rmagick'

      def initialize(options = {})
          input_file = Magick::Image.read(options[:input_file]).first
          @dimensions = options[:dimensions]
          processed_file = reprocess_from_input(input_file) #the to_s suuuucks, clean up
          save_file(processed_file, options[:output_files])
      end

      def reprocess_from_input(magick_input)
          output_files = magick_input.resize_to_fill(@dimensions[:x], @dimensions[:y])
      end

      def save_file(processed_file, output_files)
          processed_file.write(output_files[:save_path] + output_files[:save_name] + "_#{@dimensions[:x]}_#{@dimensions[:y]}" + ".jpg")
      end

  end
end

# notes
# options = {:input_file => "#{Rails.root.join('public/uploads/test/')}game-of-thrones-takes-over-comic-con.jpg", :dimensions => {:x => 144, :y => 200}, :output_files => {:save_path => "#{Rails.root.join('public/uploads/test/output/')}", :save_name => "biopic_some_id"}}