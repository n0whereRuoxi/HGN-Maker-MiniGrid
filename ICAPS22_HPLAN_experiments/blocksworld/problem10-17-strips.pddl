( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b59 - block
    b521 - block
    b346 - block
    b187 - block
    b482 - block
    b682 - block
    b49 - block
    b841 - block
    b771 - block
    b778 - block
    b671 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b59 )
    ( on b521 b59 )
    ( on b346 b521 )
    ( on b187 b346 )
    ( on b482 b187 )
    ( on b682 b482 )
    ( on b49 b682 )
    ( on b841 b49 )
    ( on b771 b841 )
    ( on b778 b771 )
    ( on b671 b778 )
    ( clear b671 )
  )
  ( :goal
    ( and
      ( clear b59 )
    )
  )
)
