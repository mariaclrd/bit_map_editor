module BitmapEditor
  class BitMap
    class << self
      attr_writer :bit_map

      WHITE_BIT = 'O'.freeze
      NUMBER_OF_ROWS_EXCEEDED = 'Invalid row number'.freeze
      NUMBER_OF_COLUMNS_EXCEEDED = 'Invalid column number'.freeze
      INVALID_VALUE = 'Invalid value'.freeze

      def bit_map
        @bit_map ||= []
      end

      def create(rows_number:, columns_number: )
        self.bit_map = Array.new(rows_number).map{|row| Array.new(columns_number).map{|element| WHITE_BIT} }
      end

      def set_pixel(row:, column:, value:)
        return  error(NUMBER_OF_ROWS_EXCEEDED) unless valid_row?(row)
        return error(NUMBER_OF_COLUMNS_EXCEEDED)  unless valid_column?(column)
        return error(INVALID_VALUE)  unless valid_value?(value)
        bit_map[row-1][column-1] = value
        [true, nil]
      end

      private

      def valid_row?(row)
        row > 0 && row < bit_map.size
      end

      def valid_column?(column)
        column > 0 && column < bit_map.first.size
      end

      def valid_value?(value)
        valid_values = (10...36).map{ |i| i.to_s(36).upcase}
        valid_values.include?(value)
      end

      def error(message)
        [false, message]
      end
    end
  end
end