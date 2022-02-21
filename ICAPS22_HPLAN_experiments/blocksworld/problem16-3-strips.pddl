( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b739 - block
    b714 - block
    b68 - block
    b329 - block
    b980 - block
    b176 - block
    b272 - block
    b277 - block
    b790 - block
    b670 - block
    b63 - block
    b673 - block
    b505 - block
    b285 - block
    b87 - block
    b436 - block
    b830 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b739 )
    ( on b714 b739 )
    ( on b68 b714 )
    ( on b329 b68 )
    ( on b980 b329 )
    ( on b176 b980 )
    ( on b272 b176 )
    ( on b277 b272 )
    ( on b790 b277 )
    ( on b670 b790 )
    ( on b63 b670 )
    ( on b673 b63 )
    ( on b505 b673 )
    ( on b285 b505 )
    ( on b87 b285 )
    ( on b436 b87 )
    ( on b830 b436 )
    ( clear b830 )
  )
  ( :goal
    ( and
      ( clear b739 )
    )
  )
)
