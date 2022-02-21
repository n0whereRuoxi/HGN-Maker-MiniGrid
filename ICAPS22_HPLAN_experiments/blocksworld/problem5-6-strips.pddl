( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b234 - block
    b116 - block
    b823 - block
    b697 - block
    b832 - block
    b152 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b234 )
    ( on b116 b234 )
    ( on b823 b116 )
    ( on b697 b823 )
    ( on b832 b697 )
    ( on b152 b832 )
    ( clear b152 )
  )
  ( :goal
    ( and
      ( clear b234 )
    )
  )
)
