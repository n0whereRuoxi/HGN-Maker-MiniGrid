( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b832 - block
    b929 - block
    b632 - block
    b534 - block
    b850 - block
    b645 - block
    b134 - block
    b619 - block
    b805 - block
    b642 - block
    b672 - block
    b39 - block
    b546 - block
    b338 - block
    b317 - block
    b185 - block
    b985 - block
    b293 - block
    b989 - block
    b403 - block
    b198 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b832 )
    ( on b929 b832 )
    ( on b632 b929 )
    ( on b534 b632 )
    ( on b850 b534 )
    ( on b645 b850 )
    ( on b134 b645 )
    ( on b619 b134 )
    ( on b805 b619 )
    ( on b642 b805 )
    ( on b672 b642 )
    ( on b39 b672 )
    ( on b546 b39 )
    ( on b338 b546 )
    ( on b317 b338 )
    ( on b185 b317 )
    ( on b985 b185 )
    ( on b293 b985 )
    ( on b989 b293 )
    ( on b403 b989 )
    ( on b198 b403 )
    ( clear b198 )
  )
  ( :goal
    ( and
      ( clear b832 )
    )
  )
)
