( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b679 - block
    b369 - block
    b643 - block
    b530 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b679 )
    ( on b369 b679 )
    ( on b643 b369 )
    ( on b530 b643 )
    ( clear b530 )
  )
  ( :tasks
    ( Make-3Pile b369 b643 b530 )
  )
)
