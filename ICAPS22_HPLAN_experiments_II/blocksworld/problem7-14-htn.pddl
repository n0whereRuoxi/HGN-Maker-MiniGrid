( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b250 - block
    b352 - block
    b670 - block
    b428 - block
    b148 - block
    b666 - block
    b786 - block
    b991 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b250 )
    ( on b352 b250 )
    ( on b670 b352 )
    ( on b428 b670 )
    ( on b148 b428 )
    ( on b666 b148 )
    ( on b786 b666 )
    ( on b991 b786 )
    ( clear b991 )
  )
  ( :tasks
    ( Make-7Pile b352 b670 b428 b148 b666 b786 b991 )
  )
)
