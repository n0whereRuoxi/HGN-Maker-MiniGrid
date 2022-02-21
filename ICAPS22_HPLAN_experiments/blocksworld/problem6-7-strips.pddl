( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b566 - block
    b658 - block
    b796 - block
    b941 - block
    b580 - block
    b985 - block
    b444 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b566 )
    ( on b658 b566 )
    ( on b796 b658 )
    ( on b941 b796 )
    ( on b580 b941 )
    ( on b985 b580 )
    ( on b444 b985 )
    ( clear b444 )
  )
  ( :goal
    ( and
      ( clear b566 )
    )
  )
)
