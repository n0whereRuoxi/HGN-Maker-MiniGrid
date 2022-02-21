( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b74 - block
    b704 - block
    b394 - block
    b673 - block
    b928 - block
    b534 - block
    b395 - block
    b733 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b74 )
    ( on b704 b74 )
    ( on b394 b704 )
    ( on b673 b394 )
    ( on b928 b673 )
    ( on b534 b928 )
    ( on b395 b534 )
    ( on b733 b395 )
    ( clear b733 )
  )
  ( :goal
    ( and
      ( clear b74 )
    )
  )
)
