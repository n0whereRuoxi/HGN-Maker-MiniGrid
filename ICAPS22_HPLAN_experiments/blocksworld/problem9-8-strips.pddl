( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b795 - block
    b309 - block
    b186 - block
    b158 - block
    b591 - block
    b901 - block
    b347 - block
    b24 - block
    b332 - block
    b424 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b795 )
    ( on b309 b795 )
    ( on b186 b309 )
    ( on b158 b186 )
    ( on b591 b158 )
    ( on b901 b591 )
    ( on b347 b901 )
    ( on b24 b347 )
    ( on b332 b24 )
    ( on b424 b332 )
    ( clear b424 )
  )
  ( :goal
    ( and
      ( clear b795 )
    )
  )
)
