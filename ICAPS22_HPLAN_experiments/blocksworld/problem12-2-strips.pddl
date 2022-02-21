( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b445 - block
    b586 - block
    b956 - block
    b16 - block
    b924 - block
    b958 - block
    b433 - block
    b573 - block
    b624 - block
    b808 - block
    b344 - block
    b607 - block
    b900 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b445 )
    ( on b586 b445 )
    ( on b956 b586 )
    ( on b16 b956 )
    ( on b924 b16 )
    ( on b958 b924 )
    ( on b433 b958 )
    ( on b573 b433 )
    ( on b624 b573 )
    ( on b808 b624 )
    ( on b344 b808 )
    ( on b607 b344 )
    ( on b900 b607 )
    ( clear b900 )
  )
  ( :goal
    ( and
      ( clear b445 )
    )
  )
)
