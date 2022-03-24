( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b885 - block
    b469 - block
    b381 - block
    b137 - block
    b828 - block
    b927 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b885 )
    ( on b469 b885 )
    ( on b381 b469 )
    ( on b137 b381 )
    ( on b828 b137 )
    ( on b927 b828 )
    ( clear b927 )
  )
  ( :tasks
    ( Make-5Pile b469 b381 b137 b828 b927 )
  )
)
