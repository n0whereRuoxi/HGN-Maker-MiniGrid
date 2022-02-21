( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b253 - block
    b362 - block
    b846 - block
    b45 - block
    b167 - block
    b874 - block
    b985 - block
    b455 - block
    b595 - block
    b65 - block
    b851 - block
    b255 - block
    b750 - block
    b1 - block
    b542 - block
    b198 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b253 )
    ( on b362 b253 )
    ( on b846 b362 )
    ( on b45 b846 )
    ( on b167 b45 )
    ( on b874 b167 )
    ( on b985 b874 )
    ( on b455 b985 )
    ( on b595 b455 )
    ( on b65 b595 )
    ( on b851 b65 )
    ( on b255 b851 )
    ( on b750 b255 )
    ( on b1 b750 )
    ( on b542 b1 )
    ( on b198 b542 )
    ( clear b198 )
  )
  ( :goal
    ( and
      ( clear b253 )
    )
  )
)
