( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b375 - block
    b911 - block
    b282 - block
    b678 - block
    b395 - block
    b532 - block
    b186 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b375 )
    ( on b911 b375 )
    ( on b282 b911 )
    ( on b678 b282 )
    ( on b395 b678 )
    ( on b532 b395 )
    ( on b186 b532 )
    ( clear b186 )
  )
  ( :tasks
    ( Make-6Pile b911 b282 b678 b395 b532 b186 )
  )
)
