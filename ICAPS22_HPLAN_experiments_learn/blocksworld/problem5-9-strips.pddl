( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b352 - block
    b844 - block
    b480 - block
    b26 - block
    b756 - block
    b181 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b352 )
    ( on b844 b352 )
    ( on b480 b844 )
    ( on b26 b480 )
    ( on b756 b26 )
    ( on b181 b756 )
    ( clear b181 )
  )
  ( :goal
    ( and
      ( clear b352 )
    )
  )
)
