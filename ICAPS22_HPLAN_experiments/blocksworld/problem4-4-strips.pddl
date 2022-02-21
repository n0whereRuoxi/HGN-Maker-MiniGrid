( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b663 - block
    b459 - block
    b888 - block
    b715 - block
    b731 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b663 )
    ( on b459 b663 )
    ( on b888 b459 )
    ( on b715 b888 )
    ( on b731 b715 )
    ( clear b731 )
  )
  ( :goal
    ( and
      ( clear b663 )
      ( clear b663 )
      ( clear b663 )
      ( clear b663 )
      ( clear b663 )
    )
  )
)
