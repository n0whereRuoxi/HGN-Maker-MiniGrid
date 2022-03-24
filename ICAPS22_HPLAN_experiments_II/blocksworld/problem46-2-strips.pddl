( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b603 - block
    b884 - block
    b903 - block
    b348 - block
    b96 - block
    b917 - block
    b109 - block
    b47 - block
    b618 - block
    b213 - block
    b623 - block
    b539 - block
    b562 - block
    b178 - block
    b6 - block
    b372 - block
    b662 - block
    b190 - block
    b948 - block
    b548 - block
    b758 - block
    b748 - block
    b513 - block
    b677 - block
    b932 - block
    b728 - block
    b360 - block
    b668 - block
    b251 - block
    b923 - block
    b678 - block
    b394 - block
    b218 - block
    b756 - block
    b192 - block
    b960 - block
    b684 - block
    b260 - block
    b370 - block
    b998 - block
    b723 - block
    b606 - block
    b733 - block
    b969 - block
    b840 - block
    b250 - block
    b187 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b603 )
    ( on b884 b603 )
    ( on b903 b884 )
    ( on b348 b903 )
    ( on b96 b348 )
    ( on b917 b96 )
    ( on b109 b917 )
    ( on b47 b109 )
    ( on b618 b47 )
    ( on b213 b618 )
    ( on b623 b213 )
    ( on b539 b623 )
    ( on b562 b539 )
    ( on b178 b562 )
    ( on b6 b178 )
    ( on b372 b6 )
    ( on b662 b372 )
    ( on b190 b662 )
    ( on b948 b190 )
    ( on b548 b948 )
    ( on b758 b548 )
    ( on b748 b758 )
    ( on b513 b748 )
    ( on b677 b513 )
    ( on b932 b677 )
    ( on b728 b932 )
    ( on b360 b728 )
    ( on b668 b360 )
    ( on b251 b668 )
    ( on b923 b251 )
    ( on b678 b923 )
    ( on b394 b678 )
    ( on b218 b394 )
    ( on b756 b218 )
    ( on b192 b756 )
    ( on b960 b192 )
    ( on b684 b960 )
    ( on b260 b684 )
    ( on b370 b260 )
    ( on b998 b370 )
    ( on b723 b998 )
    ( on b606 b723 )
    ( on b733 b606 )
    ( on b969 b733 )
    ( on b840 b969 )
    ( on b250 b840 )
    ( on b187 b250 )
    ( clear b187 )
  )
  ( :goal
    ( and
      ( clear b603 )
    )
  )
)
