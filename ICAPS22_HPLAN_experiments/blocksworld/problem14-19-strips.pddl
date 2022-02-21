( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b169 - block
    b300 - block
    b942 - block
    b40 - block
    b820 - block
    b557 - block
    b985 - block
    b871 - block
    b833 - block
    b707 - block
    b907 - block
    b553 - block
    b768 - block
    b765 - block
    b274 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b169 )
    ( on b300 b169 )
    ( on b942 b300 )
    ( on b40 b942 )
    ( on b820 b40 )
    ( on b557 b820 )
    ( on b985 b557 )
    ( on b871 b985 )
    ( on b833 b871 )
    ( on b707 b833 )
    ( on b907 b707 )
    ( on b553 b907 )
    ( on b768 b553 )
    ( on b765 b768 )
    ( on b274 b765 )
    ( clear b274 )
  )
  ( :goal
    ( and
      ( clear b169 )
    )
  )
)
