( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b221 - block
    b283 - block
    b597 - block
    b598 - block
    b214 - block
    b202 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b221 )
    ( on b283 b221 )
    ( on b597 b283 )
    ( on b598 b597 )
    ( on b214 b598 )
    ( on b202 b214 )
    ( clear b202 )
  )
  ( :goal
    ( and
      ( clear b221 )
    )
  )
)
