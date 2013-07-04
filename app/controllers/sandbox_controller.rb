# coding: utf-8

require 'net/http'

class SandboxController < ApplicationController
  def index
  end

  def update_pict
#    serche_str = 'ボーダーコリー'
    serche_str = 'Kathryn Morris'	# 初期値

    if params[ :keywd ] == ""
      serche_str = serche_str
    else
      serche_str = params[ :keywd ]
    end

    Net::HTTP.start('api.bing.net') do |http|
      response = http.get( '/json.aspx?Appid=CE838C7EF23FB3D8E8E12A633DFF833A67E84D56&Version=2.2&query=' +  ERB::Util.url_encode( serche_str ) + '&Sources=image&Image.Offset=0&Image.Count=50&Web.Count=1' )
      @body = response.body
    end

    hatena_json_uri = "http://b.hatena.ne.jp/entry/json/?url=http://www.yahoo.co.jp/"
    res = Net::HTTP.get_response( URI.parse( hatena_json_uri ) )
    @hatebu = JSON.parse(res.body)
    
#    source = "http://tstylestudio.com/wp/feed/"
#    @feed = FeedNormalizer::FeedNormalizer.parse( open( source ), :force_parser => FeedNormalizer::SimpleRssParser ).items[0] 
##    @blog_title = feed.title.force_encoding( 'utf-8' )
    uri = ARGV.shift || 'http://rssblog.ameba.jp/homebrewstudio/rss20.xml'
    @feed = FeedNormalizer::FeedNormalizer.parse( open( uri ), :force_parser => FeedNormalizer::SimpleRssParser )

  end

end



