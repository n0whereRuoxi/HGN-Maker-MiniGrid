( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b629 - block
    b426 - block
    b620 - block
    b964 - block
    b338 - block
    b383 - block
    b807 - block
    b980 - block
    b256 - block
    b368 - block
    b963 - block
    b147 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b629 )
    ( on b426 b629 )
    ( on b620 b426 )
    ( on b964 b620 )
    ( on b338 b964 )
    ( on b383 b338 )
    ( on b807 b383 )
    ( on b980 b807 )
    ( on b256 b980 )
    ( on b368 b256 )
    ( on b963 b368 )
    ( on b147 b963 )
    ( clear b147 )
  )
  ( :goal
    ( and
      ( clear b629 )
    )
  )
)
