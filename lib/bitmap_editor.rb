module BitmapEditor

  autoload :LineProcessor,   "bitmap_editor/line_processor"
  autoload :BitMap,          "bitmap_editor/bit_map"

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp
      result = LineProcessor.call(line)

      puts result if result
    end
  end

  module_function :run
end
