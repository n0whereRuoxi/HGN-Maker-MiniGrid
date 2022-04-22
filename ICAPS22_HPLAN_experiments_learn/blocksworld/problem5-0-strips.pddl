( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b594 - block
    b513 - block
    b106 - block
    b58 - block
    b61 - block
    b784 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b594 )
    ( on b513 b594 )
    ( on b106 b513 )
    ( on b58 b106 )
    ( on b61 b58 )
    ( on b784 b61 )
    ( clear b784 )
  )
  ( :goal
    ( and
      ( clear b594 )
    )
  )
)
