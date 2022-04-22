( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b234 - block
    b540 - block
    b766 - block
    b857 - block
    b129 - block
    b780 - block
    b625 - block
    b793 - block
    b444 - block
    b389 - block
    b656 - block
    b498 - block
    b862 - block
    b595 - block
    b896 - block
    b312 - block
    b297 - block
    b376 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b234 )
    ( on b540 b234 )
    ( on b766 b540 )
    ( on b857 b766 )
    ( on b129 b857 )
    ( on b780 b129 )
    ( on b625 b780 )
    ( on b793 b625 )
    ( on b444 b793 )
    ( on b389 b444 )
    ( on b656 b389 )
    ( on b498 b656 )
    ( on b862 b498 )
    ( on b595 b862 )
    ( on b896 b595 )
    ( on b312 b896 )
    ( on b297 b312 )
    ( on b376 b297 )
    ( clear b376 )
  )
  ( :goal
    ( and
      ( clear b234 )
    )
  )
)
