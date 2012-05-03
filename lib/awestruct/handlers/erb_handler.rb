
require 'awestruct/handlers/base_handler'

module Awestruct
  module Handlers
    class ErbHandler < BaseHandler

      def initialize(site, delegate)
        super( site, delegate )
      end

      def simple_name
        File.basename( File.basename( relative_source_path, '.erb' ), output_extension )
      end

      def output_filename
        File.basename( relative_source_path, '.erb' )
      end

      def output_extension
        File.extname( output_filename )
      end

      def content_syntax
        :erb
      end

      def rendered_content(context, with_layouts=true)
        erb = ERB.new( delegate.rendered_content( context, with_layouts) )
        erb.result( context.send( :binding ) )
      end
    end
  end
end
