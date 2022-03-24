( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b269 - block
    b501 - block
    b394 - block
    b774 - block
    b906 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b269 )
    ( on b501 b269 )
    ( on b394 b501 )
    ( on b774 b394 )
    ( on b906 b774 )
    ( clear b906 )
  )
  ( :tasks
    ( Make-4Pile b501 b394 b774 b906 )
  )
)
