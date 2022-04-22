( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b286 - block
    b628 - block
    b742 - block
    b531 - block
    b144 - block
    b8 - block
    b895 - block
    b669 - block
    b573 - block
    b642 - block
    b11 - block
    b985 - block
    b610 - block
    b900 - block
    b263 - block
    b333 - block
    b906 - block
    b514 - block
    b248 - block
    b16 - block
    b321 - block
    b601 - block
    b97 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b286 )
    ( on b628 b286 )
    ( on b742 b628 )
    ( on b531 b742 )
    ( on b144 b531 )
    ( on b8 b144 )
    ( on b895 b8 )
    ( on b669 b895 )
    ( on b573 b669 )
    ( on b642 b573 )
    ( on b11 b642 )
    ( on b985 b11 )
    ( on b610 b985 )
    ( on b900 b610 )
    ( on b263 b900 )
    ( on b333 b263 )
    ( on b906 b333 )
    ( on b514 b906 )
    ( on b248 b514 )
    ( on b16 b248 )
    ( on b321 b16 )
    ( on b601 b321 )
    ( on b97 b601 )
    ( clear b97 )
  )
  ( :goal
    ( and
      ( clear b286 )
    )
  )
)
