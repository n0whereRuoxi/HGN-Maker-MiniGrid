( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b448 - block
    b942 - block
    b717 - block
    b962 - block
    b780 - block
    b713 - block
    b492 - block
    b30 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b448 )
    ( on b942 b448 )
    ( on b717 b942 )
    ( on b962 b717 )
    ( on b780 b962 )
    ( on b713 b780 )
    ( on b492 b713 )
    ( on b30 b492 )
    ( clear b30 )
  )
  ( :goal
    ( and
      ( clear b448 )
    )
  )
)
