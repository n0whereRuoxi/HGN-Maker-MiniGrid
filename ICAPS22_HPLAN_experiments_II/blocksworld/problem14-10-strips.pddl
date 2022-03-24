( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b884 - block
    b218 - block
    b336 - block
    b445 - block
    b182 - block
    b636 - block
    b691 - block
    b22 - block
    b421 - block
    b94 - block
    b489 - block
    b5 - block
    b119 - block
    b958 - block
    b686 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b884 )
    ( on b218 b884 )
    ( on b336 b218 )
    ( on b445 b336 )
    ( on b182 b445 )
    ( on b636 b182 )
    ( on b691 b636 )
    ( on b22 b691 )
    ( on b421 b22 )
    ( on b94 b421 )
    ( on b489 b94 )
    ( on b5 b489 )
    ( on b119 b5 )
    ( on b958 b119 )
    ( on b686 b958 )
    ( clear b686 )
  )
  ( :goal
    ( and
      ( clear b884 )
    )
  )
)
