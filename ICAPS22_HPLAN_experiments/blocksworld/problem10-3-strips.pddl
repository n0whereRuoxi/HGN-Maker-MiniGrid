( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b905 - block
    b696 - block
    b228 - block
    b191 - block
    b133 - block
    b160 - block
    b476 - block
    b931 - block
    b321 - block
    b134 - block
    b42 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b905 )
    ( on b696 b905 )
    ( on b228 b696 )
    ( on b191 b228 )
    ( on b133 b191 )
    ( on b160 b133 )
    ( on b476 b160 )
    ( on b931 b476 )
    ( on b321 b931 )
    ( on b134 b321 )
    ( on b42 b134 )
    ( clear b42 )
  )
  ( :goal
    ( and
      ( clear b905 )
    )
  )
)
