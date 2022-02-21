( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b694 - block
    b873 - block
    b894 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b694 )
    ( on b873 b694 )
    ( on b894 b873 )
    ( clear b894 )
  )
  ( :goal
    ( and
      ( clear b694 )
      ( clear b694 )
      ( clear b694 )
    )
  )
)
