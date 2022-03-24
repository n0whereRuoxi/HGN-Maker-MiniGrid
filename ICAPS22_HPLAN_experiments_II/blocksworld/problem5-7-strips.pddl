( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b295 - block
    b482 - block
    b112 - block
    b316 - block
    b916 - block
    b809 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b295 )
    ( on b482 b295 )
    ( on b112 b482 )
    ( on b316 b112 )
    ( on b916 b316 )
    ( on b809 b916 )
    ( clear b809 )
  )
  ( :goal
    ( and
      ( clear b295 )
    )
  )
)
