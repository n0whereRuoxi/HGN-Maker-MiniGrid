( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b417 - block
    b952 - block
    b554 - block
    b221 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b417 )
    ( on b952 b417 )
    ( on b554 b952 )
    ( on b221 b554 )
    ( clear b221 )
  )
  ( :tasks
    ( Make-3Pile b952 b554 b221 )
  )
)
