( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b235 - block
    b486 - block
    b98 - block
    b151 - block
    b300 - block
    b176 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b235 )
    ( on b486 b235 )
    ( on b98 b486 )
    ( on b151 b98 )
    ( on b300 b151 )
    ( on b176 b300 )
    ( clear b176 )
  )
  ( :goal
    ( and
      ( clear b235 )
    )
  )
)
