( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b153 - block
    b922 - block
    b315 - block
    b930 - block
    b843 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b153 )
    ( on b922 b153 )
    ( on b315 b922 )
    ( on b930 b315 )
    ( on b843 b930 )
    ( clear b843 )
  )
  ( :goal
    ( and
      ( clear b153 )
      ( clear b153 )
      ( clear b153 )
      ( clear b153 )
      ( clear b153 )
    )
  )
)
