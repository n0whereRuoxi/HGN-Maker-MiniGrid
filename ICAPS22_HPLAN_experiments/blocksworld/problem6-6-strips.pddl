( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b230 - block
    b463 - block
    b5 - block
    b266 - block
    b861 - block
    b3 - block
    b440 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b230 )
    ( on b463 b230 )
    ( on b5 b463 )
    ( on b266 b5 )
    ( on b861 b266 )
    ( on b3 b861 )
    ( on b440 b3 )
    ( clear b440 )
  )
  ( :goal
    ( and
      ( clear b230 )
    )
  )
)
