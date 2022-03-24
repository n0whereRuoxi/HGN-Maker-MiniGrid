( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b369 - block
    b233 - block
    b127 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b369 )
    ( on b233 b369 )
    ( on b127 b233 )
    ( clear b127 )
  )
  ( :goal
    ( and
      ( clear b369 )
    )
  )
)
