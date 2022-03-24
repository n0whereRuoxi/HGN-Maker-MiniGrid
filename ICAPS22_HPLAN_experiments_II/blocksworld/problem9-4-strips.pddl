( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b379 - block
    b983 - block
    b90 - block
    b642 - block
    b898 - block
    b223 - block
    b910 - block
    b286 - block
    b495 - block
    b148 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b379 )
    ( on b983 b379 )
    ( on b90 b983 )
    ( on b642 b90 )
    ( on b898 b642 )
    ( on b223 b898 )
    ( on b910 b223 )
    ( on b286 b910 )
    ( on b495 b286 )
    ( on b148 b495 )
    ( clear b148 )
  )
  ( :goal
    ( and
      ( clear b379 )
    )
  )
)
