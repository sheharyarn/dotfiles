#!/usr/bin/env ruby

def normalize_episode_names
	$match_regex = /(.*\.)(\d{1,2})(\d{2})(\..*\.)(mp4|mkv|m4v|avi)$/

	def new_name_for(file)
		season = file.gsub $match_regex, '\2'
		season = "0#{season}" if season.length < 2

		file.gsub $match_regex, '\1s' + season + 'e\3\4\5'
	end

	files = Dir['*'].select { |f| f =~ $match_regex }
	files.each do |f|
		new_name = new_name_for(f)
		File.rename f, new_name

		puts "Renamed '#{f}' to '#{new_name}'"
	end
end

# The.Flash.2014.118.720p.HDTV.X264-DIMENSION.mkv
# should be this
# (.*\.)(\d{4}\.)?(\d{1,2})(\d{2})(.*\.)(mp4|avi|mkv)$