( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b676 - block
    b721 - block
    b236 - block
    b250 - block
    b891 - block
    b851 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b676 )
    ( on b721 b676 )
    ( on b236 b721 )
    ( on b250 b236 )
    ( on b891 b250 )
    ( on b851 b891 )
    ( clear b851 )
  )
  ( :tasks
    ( Make-5Pile b721 b236 b250 b891 b851 )
  )
)
