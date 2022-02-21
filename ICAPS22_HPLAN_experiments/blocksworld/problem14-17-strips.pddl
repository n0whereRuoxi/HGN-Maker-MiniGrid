( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b89 - block
    b66 - block
    b386 - block
    b92 - block
    b681 - block
    b100 - block
    b98 - block
    b260 - block
    b905 - block
    b418 - block
    b317 - block
    b159 - block
    b334 - block
    b384 - block
    b223 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b89 )
    ( on b66 b89 )
    ( on b386 b66 )
    ( on b92 b386 )
    ( on b681 b92 )
    ( on b100 b681 )
    ( on b98 b100 )
    ( on b260 b98 )
    ( on b905 b260 )
    ( on b418 b905 )
    ( on b317 b418 )
    ( on b159 b317 )
    ( on b334 b159 )
    ( on b384 b334 )
    ( on b223 b384 )
    ( clear b223 )
  )
  ( :goal
    ( and
      ( clear b89 )
    )
  )
)
