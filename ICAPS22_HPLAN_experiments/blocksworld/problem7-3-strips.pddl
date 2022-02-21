( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b757 - block
    b666 - block
    b429 - block
    b985 - block
    b888 - block
    b367 - block
    b481 - block
    b95 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b757 )
    ( on b666 b757 )
    ( on b429 b666 )
    ( on b985 b429 )
    ( on b888 b985 )
    ( on b367 b888 )
    ( on b481 b367 )
    ( on b95 b481 )
    ( clear b95 )
  )
  ( :goal
    ( and
      ( clear b757 )
    )
  )
)
