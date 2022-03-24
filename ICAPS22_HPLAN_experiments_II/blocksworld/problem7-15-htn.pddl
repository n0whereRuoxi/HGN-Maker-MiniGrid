( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b43 - block
    b412 - block
    b54 - block
    b834 - block
    b880 - block
    b99 - block
    b147 - block
    b973 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b43 )
    ( on b412 b43 )
    ( on b54 b412 )
    ( on b834 b54 )
    ( on b880 b834 )
    ( on b99 b880 )
    ( on b147 b99 )
    ( on b973 b147 )
    ( clear b973 )
  )
  ( :tasks
    ( Make-7Pile b412 b54 b834 b880 b99 b147 b973 )
  )
)
