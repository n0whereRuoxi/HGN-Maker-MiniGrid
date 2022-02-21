( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b594 - block
    b616 - block
    b75 - block
    b330 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b594 )
    ( on b616 b594 )
    ( on b75 b616 )
    ( on b330 b75 )
    ( clear b330 )
  )
  ( :goal
    ( and
      ( clear b594 )
    )
  )
)
