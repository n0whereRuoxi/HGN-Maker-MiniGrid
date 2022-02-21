( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b830 - block
    b410 - block
    b744 - block
    b844 - block
    b43 - block
    b820 - block
    b167 - block
    b342 - block
    b228 - block
    b437 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b830 )
    ( on b410 b830 )
    ( on b744 b410 )
    ( on b844 b744 )
    ( on b43 b844 )
    ( on b820 b43 )
    ( on b167 b820 )
    ( on b342 b167 )
    ( on b228 b342 )
    ( on b437 b228 )
    ( clear b437 )
  )
  ( :goal
    ( and
      ( clear b830 )
    )
  )
)
