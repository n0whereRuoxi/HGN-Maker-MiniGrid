( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b256 - block
    b535 - block
    b197 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b256 )
    ( on b535 b256 )
    ( on b197 b535 )
    ( clear b197 )
  )
  ( :tasks
    ( Make-2Pile b535 b197 )
  )
)
