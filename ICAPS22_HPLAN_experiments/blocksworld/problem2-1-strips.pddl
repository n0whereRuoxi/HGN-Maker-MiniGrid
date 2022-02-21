( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b880 - block
    b585 - block
    b463 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b880 )
    ( on b585 b880 )
    ( on b463 b585 )
    ( clear b463 )
  )
  ( :goal
    ( and
      ( clear b880 )
      ( clear b880 )
      ( clear b880 )
    )
  )
)
