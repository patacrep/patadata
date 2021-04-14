\include "../_lilypond/header"
\paper{
  paper-height = 2\cm
  paper-width= 10\cm
  line-width= 7.5\cm
}

symbols = \relative {
  \numericTimeSignature\time 4/4
  \key d \major
  c'8 \glissando cis8 e8\2 cis8 a4 b4\3
  a4 g4 a4 g4
  e4 g4\4 e4 cis4
  e4 cis4 d2\5
}

\layout { \omit Voice.StringNumber }
\score {
  <<
    \new Staff { \clef "G_8" \symbols }
    \new TabStaff { \symbols }
  >>
}
