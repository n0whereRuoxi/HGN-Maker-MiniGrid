( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b317 - block
    b158 - block
    b219 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b317 )
    ( on b158 b317 )
    ( on b219 b158 )
    ( clear b219 )
  )
  ( :goal
    ( and
      ( clear b317 )
    )
  )
)
