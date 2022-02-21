( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b20 - block
    b654 - block
    b861 - block
    b13 - block
    b798 - block
    b761 - block
    b210 - block
    b736 - block
    b38 - block
    b429 - block
    b715 - block
    b438 - block
    b928 - block
    b283 - block
    b548 - block
    b121 - block
    b525 - block
    b451 - block
    b778 - block
    b118 - block
    b391 - block
    b201 - block
    b301 - block
    b920 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b20 )
    ( on b654 b20 )
    ( on b861 b654 )
    ( on b13 b861 )
    ( on b798 b13 )
    ( on b761 b798 )
    ( on b210 b761 )
    ( on b736 b210 )
    ( on b38 b736 )
    ( on b429 b38 )
    ( on b715 b429 )
    ( on b438 b715 )
    ( on b928 b438 )
    ( on b283 b928 )
    ( on b548 b283 )
    ( on b121 b548 )
    ( on b525 b121 )
    ( on b451 b525 )
    ( on b778 b451 )
    ( on b118 b778 )
    ( on b391 b118 )
    ( on b201 b391 )
    ( on b301 b201 )
    ( on b920 b301 )
    ( clear b920 )
  )
  ( :goal
    ( and
      ( clear b20 )
    )
  )
)
