( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b439 - block
    b411 - block
    b691 - block
    b910 - block
    b208 - block
    b520 - block
    b631 - block
    b513 - block
    b14 - block
    b339 - block
    b546 - block
    b106 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b439 )
    ( on b411 b439 )
    ( on b691 b411 )
    ( on b910 b691 )
    ( on b208 b910 )
    ( on b520 b208 )
    ( on b631 b520 )
    ( on b513 b631 )
    ( on b14 b513 )
    ( on b339 b14 )
    ( on b546 b339 )
    ( on b106 b546 )
    ( clear b106 )
  )
  ( :goal
    ( and
      ( clear b439 )
    )
  )
)
