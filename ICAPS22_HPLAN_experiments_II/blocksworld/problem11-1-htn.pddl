( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b892 - block
    b982 - block
    b136 - block
    b872 - block
    b787 - block
    b677 - block
    b672 - block
    b300 - block
    b178 - block
    b576 - block
    b97 - block
    b976 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b892 )
    ( on b982 b892 )
    ( on b136 b982 )
    ( on b872 b136 )
    ( on b787 b872 )
    ( on b677 b787 )
    ( on b672 b677 )
    ( on b300 b672 )
    ( on b178 b300 )
    ( on b576 b178 )
    ( on b97 b576 )
    ( on b976 b97 )
    ( clear b976 )
  )
  ( :tasks
    ( Make-11Pile b982 b136 b872 b787 b677 b672 b300 b178 b576 b97 b976 )
  )
)
