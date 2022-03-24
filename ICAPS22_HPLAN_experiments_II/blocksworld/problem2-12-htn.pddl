( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b261 - block
    b115 - block
    b122 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b261 )
    ( on b115 b261 )
    ( on b122 b115 )
    ( clear b122 )
  )
  ( :tasks
    ( Make-2Pile b115 b122 )
  )
)
