( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b990 - block
    b68 - block
    b904 - block
    b766 - block
    b586 - block
    b628 - block
    b835 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b990 )
    ( on b68 b990 )
    ( on b904 b68 )
    ( on b766 b904 )
    ( on b586 b766 )
    ( on b628 b586 )
    ( on b835 b628 )
    ( clear b835 )
  )
  ( :goal
    ( and
      ( clear b990 )
    )
  )
)
