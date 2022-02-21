( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b961 - block
    b827 - block
    b611 - block
    b627 - block
    b482 - block
    b65 - block
    b811 - block
    b327 - block
    b519 - block
    b672 - block
    b213 - block
    b814 - block
    b655 - block
    b595 - block
    b599 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b961 )
    ( on b827 b961 )
    ( on b611 b827 )
    ( on b627 b611 )
    ( on b482 b627 )
    ( on b65 b482 )
    ( on b811 b65 )
    ( on b327 b811 )
    ( on b519 b327 )
    ( on b672 b519 )
    ( on b213 b672 )
    ( on b814 b213 )
    ( on b655 b814 )
    ( on b595 b655 )
    ( on b599 b595 )
    ( clear b599 )
  )
  ( :goal
    ( and
      ( clear b961 )
    )
  )
)
