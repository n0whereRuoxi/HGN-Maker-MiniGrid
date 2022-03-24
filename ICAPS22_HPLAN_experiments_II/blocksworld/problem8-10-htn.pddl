( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b115 - block
    b402 - block
    b21 - block
    b418 - block
    b841 - block
    b616 - block
    b935 - block
    b581 - block
    b101 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b115 )
    ( on b402 b115 )
    ( on b21 b402 )
    ( on b418 b21 )
    ( on b841 b418 )
    ( on b616 b841 )
    ( on b935 b616 )
    ( on b581 b935 )
    ( on b101 b581 )
    ( clear b101 )
  )
  ( :tasks
    ( Make-8Pile b402 b21 b418 b841 b616 b935 b581 b101 )
  )
)
