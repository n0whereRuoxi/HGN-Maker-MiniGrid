( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b999 - block
    b913 - block
    b41 - block
    b646 - block
    b331 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b999 )
    ( on b913 b999 )
    ( on b41 b913 )
    ( on b646 b41 )
    ( on b331 b646 )
    ( clear b331 )
  )
  ( :tasks
    ( Make-4Pile b913 b41 b646 b331 )
  )
)
