( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b521 - block
    b921 - block
    b489 - block
    b205 - block
    b138 - block
    b422 - block
    b897 - block
    b753 - block
    b593 - block
    b128 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b521 )
    ( on b921 b521 )
    ( on b489 b921 )
    ( on b205 b489 )
    ( on b138 b205 )
    ( on b422 b138 )
    ( on b897 b422 )
    ( on b753 b897 )
    ( on b593 b753 )
    ( on b128 b593 )
    ( clear b128 )
  )
  ( :tasks
    ( Make-9Pile b921 b489 b205 b138 b422 b897 b753 b593 b128 )
  )
)
