( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b769 - block
    b902 - block
    b548 - block
    b899 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b769 )
    ( on b902 b769 )
    ( on b548 b902 )
    ( on b899 b548 )
    ( clear b899 )
  )
  ( :goal
    ( and
      ( clear b769 )
      ( clear b769 )
      ( clear b769 )
      ( clear b769 )
    )
  )
)
