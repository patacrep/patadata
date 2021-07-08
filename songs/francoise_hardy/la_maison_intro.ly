\include "../_lilypond/header"
\paper{
  paper-height = 3\cm
  paper-width= 10\cm
  line-width= 7.5\cm
}

% Issu de Il ragazzo della via Gluck
% Mais transposé de Ré majeur en Sol majeur

symbols = \transpose d g \relative {
  \numericTimeSignature\time 4/4
  \key d \major
  c'8 \glissando cis8 e8 cis8 a4 b4\2
  a4 g4\3 a4 g4\3
  e4 g4\3 e4 cis4
  e4 cis4
}

gchord = {
  <g, b, d g b g'>2 ^ "G"
}

\layout { \omit Voice.StringNumber }
\score {
  <<
    \new Staff { \clef "G_8" \symbols \gchord}
    \new TabStaff { \symbols \gchord}
  >>
}
