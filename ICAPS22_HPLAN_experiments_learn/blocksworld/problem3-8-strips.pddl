( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b621 - block
    b522 - block
    b753 - block
    b823 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b621 )
    ( on b522 b621 )
    ( on b753 b522 )
    ( on b823 b753 )
    ( clear b823 )
  )
  ( :goal
    ( and
      ( clear b621 )
    )
  )
)
