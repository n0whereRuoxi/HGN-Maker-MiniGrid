( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b242 - block
    b555 - block
    b46 - block
    b220 - block
    b288 - block
    b708 - block
    b847 - block
    b542 - block
    b748 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b242 )
    ( on b555 b242 )
    ( on b46 b555 )
    ( on b220 b46 )
    ( on b288 b220 )
    ( on b708 b288 )
    ( on b847 b708 )
    ( on b542 b847 )
    ( on b748 b542 )
    ( clear b748 )
  )
  ( :goal
    ( and
      ( clear b242 )
    )
  )
)
