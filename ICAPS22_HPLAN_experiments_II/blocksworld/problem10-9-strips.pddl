( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b8 - block
    b64 - block
    b696 - block
    b869 - block
    b649 - block
    b595 - block
    b130 - block
    b205 - block
    b150 - block
    b406 - block
    b191 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b8 )
    ( on b64 b8 )
    ( on b696 b64 )
    ( on b869 b696 )
    ( on b649 b869 )
    ( on b595 b649 )
    ( on b130 b595 )
    ( on b205 b130 )
    ( on b150 b205 )
    ( on b406 b150 )
    ( on b191 b406 )
    ( clear b191 )
  )
  ( :goal
    ( and
      ( clear b8 )
    )
  )
)
