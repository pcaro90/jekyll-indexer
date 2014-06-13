module Jekyll
  module Indexer

    def indexer_anchor(input)
        indexer_anchor_srt = ""

        input.each_line do |line|
            if /<h(?<level>\d) id="(?<id>[-a-z]+)">(?<title>[^<]*)<\/h\k<level>>/ =~ line
                indexer_anchor_srt += "<a id='%s' class='anchor'></a>\n" % [id]
                indexer_anchor_srt += "<h%{level}>%{title}</h%{level}>\n" % {:level => level, :title => title}
            else
                indexer_anchor_srt += line
            end
        end

        return indexer_anchor_srt
    end

    def indexer(input)
        index_str = ""
        stack = []

        input.each_line do |line|
            if /<h(?<level>\d) id="(?<id>[-a-z]+)">(?<title>[^<]*)<\/h\k<level>>/ =~ line
                level = level.to_i
                if stack.empty? or level > stack.last
                    stack.push level
                    index_str += "<ul>\n"
                elsif level < stack.last
                    stack.pop
                    index_str += "</ul>\n"
                end

                index_str += "<li><a href='#%s'>%s</a></li>\n" % [id, title]

            end
        end

        index_str += "</ul>\n" * stack.length
        return index_str
    end

  end
end

Liquid::Template.register_filter(Jekyll::Indexer)
