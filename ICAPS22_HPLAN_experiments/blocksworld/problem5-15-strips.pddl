( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b868 - block
    b340 - block
    b466 - block
    b58 - block
    b946 - block
    b341 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b868 )
    ( on b340 b868 )
    ( on b466 b340 )
    ( on b58 b466 )
    ( on b946 b58 )
    ( on b341 b946 )
    ( clear b341 )
  )
  ( :goal
    ( and
      ( clear b868 )
    )
  )
)
