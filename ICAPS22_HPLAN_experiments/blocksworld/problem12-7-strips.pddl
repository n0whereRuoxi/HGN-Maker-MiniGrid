( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b587 - block
    b67 - block
    b877 - block
    b357 - block
    b333 - block
    b380 - block
    b45 - block
    b334 - block
    b191 - block
    b595 - block
    b663 - block
    b692 - block
    b563 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b587 )
    ( on b67 b587 )
    ( on b877 b67 )
    ( on b357 b877 )
    ( on b333 b357 )
    ( on b380 b333 )
    ( on b45 b380 )
    ( on b334 b45 )
    ( on b191 b334 )
    ( on b595 b191 )
    ( on b663 b595 )
    ( on b692 b663 )
    ( on b563 b692 )
    ( clear b563 )
  )
  ( :goal
    ( and
      ( clear b587 )
    )
  )
)
