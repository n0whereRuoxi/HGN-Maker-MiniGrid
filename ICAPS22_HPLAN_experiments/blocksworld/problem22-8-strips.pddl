( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b251 - block
    b302 - block
    b766 - block
    b899 - block
    b803 - block
    b422 - block
    b819 - block
    b837 - block
    b332 - block
    b650 - block
    b847 - block
    b949 - block
    b49 - block
    b484 - block
    b474 - block
    b317 - block
    b832 - block
    b179 - block
    b641 - block
    b132 - block
    b507 - block
    b470 - block
    b636 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b251 )
    ( on b302 b251 )
    ( on b766 b302 )
    ( on b899 b766 )
    ( on b803 b899 )
    ( on b422 b803 )
    ( on b819 b422 )
    ( on b837 b819 )
    ( on b332 b837 )
    ( on b650 b332 )
    ( on b847 b650 )
    ( on b949 b847 )
    ( on b49 b949 )
    ( on b484 b49 )
    ( on b474 b484 )
    ( on b317 b474 )
    ( on b832 b317 )
    ( on b179 b832 )
    ( on b641 b179 )
    ( on b132 b641 )
    ( on b507 b132 )
    ( on b470 b507 )
    ( on b636 b470 )
    ( clear b636 )
  )
  ( :goal
    ( and
      ( clear b251 )
    )
  )
)
