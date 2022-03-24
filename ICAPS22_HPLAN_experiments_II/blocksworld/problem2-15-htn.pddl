( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b65 - block
    b644 - block
    b204 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b65 )
    ( on b644 b65 )
    ( on b204 b644 )
    ( clear b204 )
  )
  ( :tasks
    ( Make-2Pile b644 b204 )
  )
)
