( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b367 - block
    b409 - block
    b98 - block
    b375 - block
    b900 - block
    b88 - block
    b564 - block
    b265 - block
    b189 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b367 )
    ( on b409 b367 )
    ( on b98 b409 )
    ( on b375 b98 )
    ( on b900 b375 )
    ( on b88 b900 )
    ( on b564 b88 )
    ( on b265 b564 )
    ( on b189 b265 )
    ( clear b189 )
  )
  ( :goal
    ( and
      ( clear b367 )
    )
  )
)
