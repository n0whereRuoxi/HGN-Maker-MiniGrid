( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b951 - block
    b906 - block
    b341 - block
    b305 - block
    b87 - block
    b628 - block
    b143 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b951 )
    ( on b906 b951 )
    ( on b341 b906 )
    ( on b305 b341 )
    ( on b87 b305 )
    ( on b628 b87 )
    ( on b143 b628 )
    ( clear b143 )
  )
  ( :tasks
    ( Make-6Pile b906 b341 b305 b87 b628 b143 )
  )
)
