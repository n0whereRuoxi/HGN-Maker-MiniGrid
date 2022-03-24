( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b861 - block
    b441 - block
    b919 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b861 )
    ( on b441 b861 )
    ( on b919 b441 )
    ( clear b919 )
  )
  ( :tasks
    ( Make-2Pile b441 b919 )
  )
)
