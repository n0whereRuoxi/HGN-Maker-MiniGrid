( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b9 - block
    b838 - block
    b37 - block
    b352 - block
    b358 - block
    b336 - block
    b756 - block
    b890 - block
    b153 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b9 )
    ( on b838 b9 )
    ( on b37 b838 )
    ( on b352 b37 )
    ( on b358 b352 )
    ( on b336 b358 )
    ( on b756 b336 )
    ( on b890 b756 )
    ( on b153 b890 )
    ( clear b153 )
  )
  ( :goal
    ( and
      ( clear b9 )
    )
  )
)
