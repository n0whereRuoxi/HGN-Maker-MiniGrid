( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b949 - block
    b588 - block
    b468 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b949 )
    ( on b588 b949 )
    ( on b468 b588 )
    ( clear b468 )
  )
  ( :goal
    ( and
      ( clear b949 )
      ( clear b949 )
      ( clear b949 )
    )
  )
)
