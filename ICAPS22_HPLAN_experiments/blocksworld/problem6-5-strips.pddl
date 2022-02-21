( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b495 - block
    b200 - block
    b704 - block
    b717 - block
    b76 - block
    b828 - block
    b29 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b495 )
    ( on b200 b495 )
    ( on b704 b200 )
    ( on b717 b704 )
    ( on b76 b717 )
    ( on b828 b76 )
    ( on b29 b828 )
    ( clear b29 )
  )
  ( :goal
    ( and
      ( clear b495 )
    )
  )
)
