# frozen_string_literal: true

module Vestabule
  module CharMap
    CHARS = {
      0 => ' ',
      1 => 'A',
      2 => 'B',
      3 => 'C',
      4 => 'D',
      5 => 'E',
      6 => 'F',
      7 => 'G',
      8 => 'H',
      9 => 'I',

      10 => 'J',
      11 => 'K',
      12 => 'L',
      13 => 'M',
      14 => 'N',
      15 => 'O',
      16 => 'P',
      17 => 'Q',
      18 => 'R',
      19 => 'S',

      20 => 'T',
      21 => 'U',
      22 => 'V',
      23 => 'W',
      24 => 'X',
      25 => 'Y',
      26 => 'Z',
      27 => '1',
      28 => '2',
      29 => '3',

      30 => '4',
      31 => '5',
      32 => '6',
      33 => '7',
      34 => '8',
      35 => '9',
      36 => '0',
      37 => '!',
      38 => '@',

      40 => '$',
      41 => '(',
      42 => ')',
      44 => '-',
      46 => '+',
      47 => '&',
      48 => '=',
      49 => ';',

      50 => ':',
      52 => "'",
      53 => '"',
      54 => '%',
      55 => ',',
      56 => '.',
      59 => '/',

      60 => '?',
      62 => '°',
      63 => "\e[41m \e[0m",              # Red Background
      64 => "\e[48;2;255;165;0m \e[0m",  # Orange-like Background
      65 => "\e[43m \e[0m",              # Yellow Background
      66 => "\e[42m \e[0m",              # Green Background
      67 => "\e[44m \e[0m",              # Blue Background
      68 => "\e[45m \e[0m",              # Magenta Background
      69 => "\e[47m \e[0m",              # White Background

      70 => "\e[40m  \e[0m",             # Black Background
      71 => :filled
    }.freeze
  end
end
