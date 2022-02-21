( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b160 - block
    b784 - block
    b212 - block
    b320 - block
    b610 - block
    b73 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b160 )
    ( on b784 b160 )
    ( on b212 b784 )
    ( on b320 b212 )
    ( on b610 b320 )
    ( on b73 b610 )
    ( clear b73 )
  )
  ( :goal
    ( and
      ( clear b160 )
    )
  )
)
