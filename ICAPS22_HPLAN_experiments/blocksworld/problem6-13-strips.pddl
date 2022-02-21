( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b837 - block
    b392 - block
    b637 - block
    b867 - block
    b729 - block
    b902 - block
    b996 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b837 )
    ( on b392 b837 )
    ( on b637 b392 )
    ( on b867 b637 )
    ( on b729 b867 )
    ( on b902 b729 )
    ( on b996 b902 )
    ( clear b996 )
  )
  ( :goal
    ( and
      ( clear b837 )
    )
  )
)
