( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b510 - block
    b438 - block
    b62 - block
    b612 - block
    b920 - block
    b214 - block
    b852 - block
    b693 - block
    b131 - block
    b162 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b510 )
    ( on b438 b510 )
    ( on b62 b438 )
    ( on b612 b62 )
    ( on b920 b612 )
    ( on b214 b920 )
    ( on b852 b214 )
    ( on b693 b852 )
    ( on b131 b693 )
    ( on b162 b131 )
    ( clear b162 )
  )
  ( :goal
    ( and
      ( clear b510 )
    )
  )
)
