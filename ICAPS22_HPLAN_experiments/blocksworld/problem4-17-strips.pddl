( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b608 - block
    b967 - block
    b311 - block
    b752 - block
    b601 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b608 )
    ( on b967 b608 )
    ( on b311 b967 )
    ( on b752 b311 )
    ( on b601 b752 )
    ( clear b601 )
  )
  ( :goal
    ( and
      ( clear b608 )
    )
  )
)
