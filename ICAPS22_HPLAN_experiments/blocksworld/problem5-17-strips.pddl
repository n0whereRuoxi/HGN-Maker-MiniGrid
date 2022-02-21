( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b200 - block
    b852 - block
    b895 - block
    b244 - block
    b254 - block
    b450 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b200 )
    ( on b852 b200 )
    ( on b895 b852 )
    ( on b244 b895 )
    ( on b254 b244 )
    ( on b450 b254 )
    ( clear b450 )
  )
  ( :goal
    ( and
      ( clear b200 )
    )
  )
)
