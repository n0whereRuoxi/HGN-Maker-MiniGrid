( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b729 - block
    b67 - block
    b261 - block
    b805 - block
    b984 - block
    b32 - block
    b865 - block
    b617 - block
    b66 - block
    b891 - block
    b944 - block
    b912 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b729 )
    ( on b67 b729 )
    ( on b261 b67 )
    ( on b805 b261 )
    ( on b984 b805 )
    ( on b32 b984 )
    ( on b865 b32 )
    ( on b617 b865 )
    ( on b66 b617 )
    ( on b891 b66 )
    ( on b944 b891 )
    ( on b912 b944 )
    ( clear b912 )
  )
  ( :goal
    ( and
      ( clear b729 )
    )
  )
)
