module StateFormatter
  class << self
    def format(state)
      <<~HEREDOC.gsub(/ +\n/, "\n")
        #{"═" * 32}
        #{format_single_card_locations(state.foundations)} #{format_single_card_locations(state.cells)}

        #{format_cascades(state.cascades)}
        #{"═" * 32}
      HEREDOC
    end

    private

    def format_single_card_locations(locations)
      locations.map { |f| f.cards.last.to_s.rjust(3) }.join(" ")
    end

    def format_cascades(cascades)
      19.times.map do |i|
        cascades.map { |cascade| cascade.cards[i].to_s.rjust(3) }.join(" ")
      end.join("\n")
    end
  end
end
