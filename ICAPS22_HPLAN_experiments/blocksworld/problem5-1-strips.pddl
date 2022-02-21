( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b186 - block
    b901 - block
    b848 - block
    b887 - block
    b355 - block
    b665 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b186 )
    ( on b901 b186 )
    ( on b848 b901 )
    ( on b887 b848 )
    ( on b355 b887 )
    ( on b665 b355 )
    ( clear b665 )
  )
  ( :goal
    ( and
      ( clear b186 )
      ( clear b186 )
      ( clear b186 )
      ( clear b186 )
      ( clear b186 )
      ( clear b186 )
    )
  )
)
