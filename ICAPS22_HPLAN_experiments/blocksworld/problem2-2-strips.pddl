( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b263 - block
    b885 - block
    b416 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b263 )
    ( on b885 b263 )
    ( on b416 b885 )
    ( clear b416 )
  )
  ( :goal
    ( and
      ( clear b263 )
    )
  )
)
