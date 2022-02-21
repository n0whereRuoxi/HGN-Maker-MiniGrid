( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b732 - block
    b539 - block
    b379 - block
    b40 - block
    b481 - block
    b357 - block
    b826 - block
    b191 - block
    b691 - block
    b11 - block
    b189 - block
    b29 - block
    b546 - block
    b327 - block
    b378 - block
    b656 - block
    b971 - block
    b45 - block
    b520 - block
    b690 - block
    b532 - block
    b138 - block
    b360 - block
    b813 - block
    b925 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b732 )
    ( on b539 b732 )
    ( on b379 b539 )
    ( on b40 b379 )
    ( on b481 b40 )
    ( on b357 b481 )
    ( on b826 b357 )
    ( on b191 b826 )
    ( on b691 b191 )
    ( on b11 b691 )
    ( on b189 b11 )
    ( on b29 b189 )
    ( on b546 b29 )
    ( on b327 b546 )
    ( on b378 b327 )
    ( on b656 b378 )
    ( on b971 b656 )
    ( on b45 b971 )
    ( on b520 b45 )
    ( on b690 b520 )
    ( on b532 b690 )
    ( on b138 b532 )
    ( on b360 b138 )
    ( on b813 b360 )
    ( on b925 b813 )
    ( clear b925 )
  )
  ( :goal
    ( and
      ( clear b732 )
    )
  )
)
