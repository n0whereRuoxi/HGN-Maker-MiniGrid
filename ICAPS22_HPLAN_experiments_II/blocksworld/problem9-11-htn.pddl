( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b969 - block
    b125 - block
    b799 - block
    b294 - block
    b912 - block
    b239 - block
    b795 - block
    b908 - block
    b321 - block
    b30 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b969 )
    ( on b125 b969 )
    ( on b799 b125 )
    ( on b294 b799 )
    ( on b912 b294 )
    ( on b239 b912 )
    ( on b795 b239 )
    ( on b908 b795 )
    ( on b321 b908 )
    ( on b30 b321 )
    ( clear b30 )
  )
  ( :tasks
    ( Make-9Pile b125 b799 b294 b912 b239 b795 b908 b321 b30 )
  )
)
