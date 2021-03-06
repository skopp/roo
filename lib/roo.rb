$:.unshift(File.dirname(__FILE__))

module Roo
  class Spreadsheet
    class << self
      def open(file)
        file = String === file ? file : file.path
        begin
          case File.extname(file)
          when '.xls'
            Excel.new(file)
          when '.xlsx'
            Excelx.new(file)
          when '.ods'
            Openoffice.new(file)
          when '.xml'
            Excel2003XML.new(file)
          when ''
            Google.new(file)
          else
            raise ArgumentError, "Don't know how to open file #{file}"
          end
        rescue Ole::Storage::FormatError
          HTML.new(file)
        end
      end
    end
  end
end

require 'roo/version'
# require 'roo/spreadsheetparser' TODO:
require 'roo/generic_spreadsheet' 
require 'roo/openoffice'
require 'roo/excel'
require 'roo/excelx'
require 'roo/google'
# require 'roo/excel2003xml' TODO: convert to nokogiri
require 'roo/roo_rails_helper'
require 'roo/worksheet'
require 'roo/html'