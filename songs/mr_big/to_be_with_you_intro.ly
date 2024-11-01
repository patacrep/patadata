\include "../_lilypond/header"

intro = \relative {<e\6> \glissando <gis,\6>}

\score {
  \new TabStaff {
    \intro
  }
}
