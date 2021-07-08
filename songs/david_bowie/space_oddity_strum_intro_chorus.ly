\include "../_lilypond/header"
#(set-global-staff-size 19.997457142857144)
\paper{
  paper-height = 2\cm
  paper-width= 12\cm
  line-width= 7.5\cm
}

\header {
    author =  Intro
}

PartPOneVoiceOne =  \relative f' {
    \clef "treble" \numericTimeSignature\time 4/4 \key c \major | % 1
    \improvisationOn
    \stemUp f16 ^ "Intro & Chorus" r16 r16 \stemUp f16 \stemUp f16 r16 r16 \stemUp f16 r16
    \stemUp f16 [ \stemUp f16 ] r16 r16 \stemUp f16 [ \stemUp f16
    \stemUp f16 ] | % 2
    \improvisationOff
    \bar "|."
    }


% The score definition
\score {
    <<
        
        \new Staff
        <<
            \context Staff << 
                \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
                \context Voice = "PartPOneVoiceOne" {  \PartPOneVoiceOne }
                >>
            >>
        
        >>
    \layout {}
    }

