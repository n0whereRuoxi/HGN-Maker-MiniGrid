( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b384 - block
    b626 - block
    b486 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b384 )
    ( on b626 b384 )
    ( on b486 b626 )
    ( clear b486 )
  )
  ( :goal
    ( and
      ( clear b384 )
    )
  )
)
