\include "../_lilypond/header"
\paper{
  paper-height = 1.5\cm
  paper-width= 10\cm
  line-width= 7.5\cm
}

symbols = \relative {
  \numericTimeSignature\time 4/4
  \key c \major
  \repeat volta 7 { e8' -> e8 e8 e8 -> e8 e8 e8 e8 \mark "7×" }
  e4 d4 c4 a4 d4 c4 a4 c4 a1
}

\layout { \omit Voice.StringNumber }
\score {
  <<
    \new Staff { \clef "G_8" \symbols }
  >>
}
