( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b451 - block
    b561 - block
    b961 - block
    b26 - block
    b887 - block
    b731 - block
    b861 - block
    b498 - block
    b28 - block
    b834 - block
    b291 - block
    b301 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b451 )
    ( on b561 b451 )
    ( on b961 b561 )
    ( on b26 b961 )
    ( on b887 b26 )
    ( on b731 b887 )
    ( on b861 b731 )
    ( on b498 b861 )
    ( on b28 b498 )
    ( on b834 b28 )
    ( on b291 b834 )
    ( on b301 b291 )
    ( clear b301 )
  )
  ( :goal
    ( and
      ( clear b451 )
    )
  )
)
