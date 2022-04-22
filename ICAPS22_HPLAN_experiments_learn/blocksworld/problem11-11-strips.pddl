( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b754 - block
    b360 - block
    b945 - block
    b897 - block
    b663 - block
    b537 - block
    b493 - block
    b316 - block
    b69 - block
    b558 - block
    b336 - block
    b628 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b754 )
    ( on b360 b754 )
    ( on b945 b360 )
    ( on b897 b945 )
    ( on b663 b897 )
    ( on b537 b663 )
    ( on b493 b537 )
    ( on b316 b493 )
    ( on b69 b316 )
    ( on b558 b69 )
    ( on b336 b558 )
    ( on b628 b336 )
    ( clear b628 )
  )
  ( :goal
    ( and
      ( clear b754 )
    )
  )
)
