( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b783 - block
    b522 - block
    b11 - block
    b124 - block
    b946 - block
    b992 - block
    b330 - block
    b108 - block
    b820 - block
    b314 - block
    b95 - block
    b352 - block
    b340 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b783 )
    ( on b522 b783 )
    ( on b11 b522 )
    ( on b124 b11 )
    ( on b946 b124 )
    ( on b992 b946 )
    ( on b330 b992 )
    ( on b108 b330 )
    ( on b820 b108 )
    ( on b314 b820 )
    ( on b95 b314 )
    ( on b352 b95 )
    ( on b340 b352 )
    ( clear b340 )
  )
  ( :goal
    ( and
      ( clear b783 )
    )
  )
)
