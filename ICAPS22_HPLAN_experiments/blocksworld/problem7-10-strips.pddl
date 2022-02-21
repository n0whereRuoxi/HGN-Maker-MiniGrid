( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b999 - block
    b686 - block
    b203 - block
    b596 - block
    b420 - block
    b530 - block
    b524 - block
    b314 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b999 )
    ( on b686 b999 )
    ( on b203 b686 )
    ( on b596 b203 )
    ( on b420 b596 )
    ( on b530 b420 )
    ( on b524 b530 )
    ( on b314 b524 )
    ( clear b314 )
  )
  ( :goal
    ( and
      ( clear b999 )
    )
  )
)
