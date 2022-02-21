( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b473 - block
    b806 - block
    b567 - block
    b729 - block
    b963 - block
    b382 - block
    b799 - block
    b421 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b473 )
    ( on b806 b473 )
    ( on b567 b806 )
    ( on b729 b567 )
    ( on b963 b729 )
    ( on b382 b963 )
    ( on b799 b382 )
    ( on b421 b799 )
    ( clear b421 )
  )
  ( :goal
    ( and
      ( clear b473 )
    )
  )
)
