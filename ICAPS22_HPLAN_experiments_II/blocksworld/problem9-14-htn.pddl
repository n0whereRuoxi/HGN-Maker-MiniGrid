( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b368 - block
    b8 - block
    b579 - block
    b973 - block
    b255 - block
    b726 - block
    b358 - block
    b388 - block
    b678 - block
    b970 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b368 )
    ( on b8 b368 )
    ( on b579 b8 )
    ( on b973 b579 )
    ( on b255 b973 )
    ( on b726 b255 )
    ( on b358 b726 )
    ( on b388 b358 )
    ( on b678 b388 )
    ( on b970 b678 )
    ( clear b970 )
  )
  ( :tasks
    ( Make-9Pile b8 b579 b973 b255 b726 b358 b388 b678 b970 )
  )
)
