( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b107 - block
    b124 - block
    b790 - block
    b349 - block
    b995 - block
    b739 - block
    b168 - block
    b646 - block
    b687 - block
    b531 - block
    b893 - block
    b177 - block
    b118 - block
    b113 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b107 )
    ( on b124 b107 )
    ( on b790 b124 )
    ( on b349 b790 )
    ( on b995 b349 )
    ( on b739 b995 )
    ( on b168 b739 )
    ( on b646 b168 )
    ( on b687 b646 )
    ( on b531 b687 )
    ( on b893 b531 )
    ( on b177 b893 )
    ( on b118 b177 )
    ( on b113 b118 )
    ( clear b113 )
  )
  ( :goal
    ( and
      ( clear b107 )
    )
  )
)
