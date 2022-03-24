( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b806 - block
    b515 - block
    b17 - block
    b873 - block
    b321 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b806 )
    ( on b515 b806 )
    ( on b17 b515 )
    ( on b873 b17 )
    ( on b321 b873 )
    ( clear b321 )
  )
  ( :tasks
    ( Make-4Pile b515 b17 b873 b321 )
  )
)
