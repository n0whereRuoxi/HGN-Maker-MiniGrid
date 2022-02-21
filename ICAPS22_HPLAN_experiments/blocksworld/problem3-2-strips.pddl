( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b139 - block
    b780 - block
    b977 - block
    b786 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b139 )
    ( on b780 b139 )
    ( on b977 b780 )
    ( on b786 b977 )
    ( clear b786 )
  )
  ( :goal
    ( and
      ( clear b139 )
      ( clear b139 )
      ( clear b139 )
      ( clear b139 )
    )
  )
)
