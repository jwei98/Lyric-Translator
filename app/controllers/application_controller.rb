require 'rspotify'
require 'musix_match'

class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :create_translator
  
  m_key = ENV["MUSIXMATCH_KEY"]
  MusixMatch::API::Base.api_key = m_key

  def create_translator
      y_key = ENV["YANDEX_KEY"]
      @translator = Yandex::Translator.new(y_key)
      @all_translations = @translator.langs
  end


  def index
  end

  def discover
    @translations = Translation.all.order("created_at desc")[0..20]
  end
  
  def lyrics
    @track_id = params[:songID]
    unless @track_id.nil?
    
        # get track info
        @get_track = MusixMatch.get_track(@track_id)
        if @get_track.status_code == 200 && track = @get_track.track
          @song = track.track_name
          @artist = track.artist_name
          @title = @song.to_s + ", by " + @artist.to_s
        end
        
        # get lyrics of song
        @get_lyrics = MusixMatch.get_lyrics(@track_id)
        if @get_lyrics.status_code == 200 && lyrics = @get_lyrics.lyrics
          @lyrics = lyrics.lyrics_body()
          @language =  @translator.detect @lyrics
          
          # reduce possible translations to ones with original language
          @possible_translations = []
          (0...@all_translations.size-1).each do |i|
                translation = @all_translations[i]
                if translation[0..1] == @language
                  @possible_translations.push(translation[3..4])
                end
          end
        end
        @translation = @translator.translate @lyrics, from: @language, to: params[:lang]
    end
  end
  
  def search
      @user_search = params[:q]
      unless @user_search.nil?
        
        if @user_search.length > 0
          
          # spotify search
          tracks_search = RSpotify::Track.search(@user_search)
          
          @track_array = []
          @trackID_array = []
          @artist_array = []
          # list tracks with artists
          tracks_search.each do |track|
            @track_array.push(track.name)
            
            @search_track = MusixMatch.search_track(:q_track => track.name, :q_artist => track.artists.first.name, :page_size => 1)
            
            if @search_track.status_code == 200
              @search_track.each do |track|
                @trackID_array.push(track.track_id)
              end
            else
              puts "no"
            end
            @artist_array.push(track.artists.first.name)
          end
        end
        if @track_array && @track_array.length > 0
          @title = "Choose a Song to Translate"
        else
          @title = "No Songs were Found"
        end
    end
  end
  
  def lyrics
    @track_id = params[:songID]
    unless @track_id.nil?
    
        # get track info
        @get_track = MusixMatch.get_track(@track_id)
        if @get_track.status_code == 200 && track = @get_track.track
          @song = track.track_name
          @artist = track.artist_name
          @title = @song.to_s + ", by " + @artist.to_s
        end
      
        
        
        # get lyrics of song
        @get_lyrics = MusixMatch.get_lyrics(@track_id)
        if @get_lyrics.status_code == 200 && lyrics = @get_lyrics.lyrics
          @lyrics = lyrics.lyrics_body()
          @language =  @translator.detect @lyrics
          
          # reduce possible translations to ones with original language
          @possible_translations = []
          (0...@all_translations.size-1).each do |i|
                translation = @all_translations[i]
                if translation[0..1] == @language
                  @possible_translations.push(translation[3..4])
                end
          end
        end
        @translation = @translator.translate @lyrics, from: @language, to: params[:lang]
    end
  end
  
  def analytics
  end
  
  def create_json
  end
  
end
