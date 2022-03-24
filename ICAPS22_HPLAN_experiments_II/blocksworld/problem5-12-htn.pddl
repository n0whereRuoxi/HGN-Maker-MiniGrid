( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b26 - block
    b473 - block
    b984 - block
    b629 - block
    b368 - block
    b15 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b26 )
    ( on b473 b26 )
    ( on b984 b473 )
    ( on b629 b984 )
    ( on b368 b629 )
    ( on b15 b368 )
    ( clear b15 )
  )
  ( :tasks
    ( Make-5Pile b473 b984 b629 b368 b15 )
  )
)
