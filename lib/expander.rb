require 'net/http'

module JM3
  module ExpandUrl
    def expand_urls!
      ExpandUrl.services.each do |service|
        gsub!(service[:pattern]) { |match|
          ExpandUrl.expand($2, service[:host]) || $1
        }
      end
    end

    def expand_urls
      s = dup
      s.expand_urls!
      s
    end

    def ExpandUrl.services
      [
        { :host => "tinyurl.com", :pattern => %r'(http://tinyurl\.com(/[\w/]+))' },
        { :host => "is.gd",   :pattern => %r'(http://is\.gd(/[\w/]+))' },
        { :host => "bit.ly",  :pattern => %r'(http://bit\.ly(/[\w/]+))' },
        { :host => "t.co",    :pattern => %r'(http://t\.co(/[\w/]+))' },
      ]
    end

    def ExpandUrl.expand(path, host)
      result = ::Net::HTTP.new(host).head(path)
      case result
      when ::Net::HTTPRedirection
        result['Location']
      end
    end
  end
end

class String
  include JM3::ExpandUrl
end
