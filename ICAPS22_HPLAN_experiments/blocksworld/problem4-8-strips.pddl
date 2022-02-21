( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b737 - block
    b468 - block
    b886 - block
    b361 - block
    b142 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b737 )
    ( on b468 b737 )
    ( on b886 b468 )
    ( on b361 b886 )
    ( on b142 b361 )
    ( clear b142 )
  )
  ( :goal
    ( and
      ( clear b737 )
    )
  )
)
