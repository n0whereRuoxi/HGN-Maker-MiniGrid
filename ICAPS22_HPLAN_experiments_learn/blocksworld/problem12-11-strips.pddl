( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b925 - block
    b94 - block
    b260 - block
    b53 - block
    b173 - block
    b689 - block
    b649 - block
    b275 - block
    b228 - block
    b575 - block
    b114 - block
    b63 - block
    b612 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b925 )
    ( on b94 b925 )
    ( on b260 b94 )
    ( on b53 b260 )
    ( on b173 b53 )
    ( on b689 b173 )
    ( on b649 b689 )
    ( on b275 b649 )
    ( on b228 b275 )
    ( on b575 b228 )
    ( on b114 b575 )
    ( on b63 b114 )
    ( on b612 b63 )
    ( clear b612 )
  )
  ( :goal
    ( and
      ( clear b925 )
    )
  )
)
