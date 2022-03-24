( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b414 - block
    b204 - block
    b817 - block
    b272 - block
    b798 - block
    b205 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b414 )
    ( on b204 b414 )
    ( on b817 b204 )
    ( on b272 b817 )
    ( on b798 b272 )
    ( on b205 b798 )
    ( clear b205 )
  )
  ( :tasks
    ( Make-5Pile b204 b817 b272 b798 b205 )
  )
)
