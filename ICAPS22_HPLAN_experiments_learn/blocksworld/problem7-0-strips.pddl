( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b473 - block
    b365 - block
    b707 - block
    b189 - block
    b109 - block
    b203 - block
    b882 - block
    b925 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b473 )
    ( on b365 b473 )
    ( on b707 b365 )
    ( on b189 b707 )
    ( on b109 b189 )
    ( on b203 b109 )
    ( on b882 b203 )
    ( on b925 b882 )
    ( clear b925 )
  )
  ( :goal
    ( and
      ( clear b473 )
    )
  )
)
