\include "../_lilypond/header"
#(set-global-staff-size 19.997457142857144)
\paper{
  paper-height = 2\cm
  paper-width= 12\cm
  line-width= 7.5\cm
}

PartPOneVoiceOne =  \relative c'' {
    \clef "treble" \numericTimeSignature\time 4/4 \key c \major | % 1
    \override NoteHead.style = #'slash
    \stemUp ^ "Instrumental" c16 r16
    \override NoteHead.style = #'cross
    f,16
    \override NoteHead.style = #'slash
    f16
    \override NoteHead.style = #'cross
    f16 f16
    \override NoteHead.style = #'slash
    g16 r16
    \override NoteHead.style = #'cross
    g16 g16
    \override NoteHead.style = #'slash
    a16 r16 a16 r16
    \override NoteHead.style = #'cross
    a16 a16
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

