module ImageManipulation
  class VersionConversion
      require 'rmagick'

      def initialize(options = {})
          input_file = Magick::Image.read(options[:input_file])
          dimensions = options[:dimensions]
          processed_file = reprocess_from_input(input_file, dimensions) #the to_s suuuucks, clean up
          save_file(processed_file, options[:new_file])
      end

      def reprocess_from_input(magick_input, dimensions)
          new_file = magick_input.first.resize_to_fill(dimensions[:x], dimensions[:y])
      end

      def save_file(processed_file, new_file)
          processed_file.write(new_file[:save_path] + new_file[:save_name] + "_#{dimensions[:x]}_#{dimensions[:y]}")
      end

  end
end