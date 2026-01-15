# frozen_string_literal: true

require 'date'

module Jekyll
  module SlovakMonthFilter
    def slovak_month(input)
      months = {
        "January" => "január",
        "February" => "február",
        "March" => "marec",
        "April" => "apríl",
        "May" => "máj",
        "June" => "jún",
        "July" => "júl",
        "August" => "august",
        "September" => "september",
        "October" => "október",
        "November" => "november",
        "December" => "december"
      }

      # Konvertovanie vstupu na reťazec, ak je typu Time
      input = input.to_s if input.is_a?(Time)

      # Rozdelenie dátumu na časti
      date = Date.parse(input)
      day = date.day
      month = months[date.strftime("%B")]
      year = date.year

      # Výsledný formát
      "#{day}. #{month} #{year}"
    end
  end
end

Liquid::Template.register_filter(Jekyll::SlovakMonthFilter)