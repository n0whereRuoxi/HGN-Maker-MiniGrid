( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b122 - block
    b61 - block
    b880 - block
    b70 - block
    b999 - block
    b140 - block
    b771 - block
    b167 - block
    b404 - block
    b46 - block
    b221 - block
    b898 - block
    b200 - block
    b187 - block
    b905 - block
    b621 - block
    b83 - block
    b352 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b122 )
    ( on b61 b122 )
    ( on b880 b61 )
    ( on b70 b880 )
    ( on b999 b70 )
    ( on b140 b999 )
    ( on b771 b140 )
    ( on b167 b771 )
    ( on b404 b167 )
    ( on b46 b404 )
    ( on b221 b46 )
    ( on b898 b221 )
    ( on b200 b898 )
    ( on b187 b200 )
    ( on b905 b187 )
    ( on b621 b905 )
    ( on b83 b621 )
    ( on b352 b83 )
    ( clear b352 )
  )
  ( :goal
    ( and
      ( clear b122 )
    )
  )
)
