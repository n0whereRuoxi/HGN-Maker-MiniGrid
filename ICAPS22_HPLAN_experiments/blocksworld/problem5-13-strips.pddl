( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b450 - block
    b934 - block
    b399 - block
    b748 - block
    b264 - block
    b216 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b450 )
    ( on b934 b450 )
    ( on b399 b934 )
    ( on b748 b399 )
    ( on b264 b748 )
    ( on b216 b264 )
    ( clear b216 )
  )
  ( :goal
    ( and
      ( clear b450 )
      ( clear b450 )
      ( clear b450 )
      ( clear b450 )
      ( clear b450 )
      ( clear b450 )
    )
  )
)
