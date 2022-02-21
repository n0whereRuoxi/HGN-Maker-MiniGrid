( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b858 - block
    b136 - block
    b47 - block
    b566 - block
    b544 - block
    b773 - block
    b483 - block
    b98 - block
    b22 - block
    b868 - block
    b494 - block
    b682 - block
    b71 - block
    b795 - block
    b878 - block
    b891 - block
    b360 - block
    b104 - block
    b56 - block
    b376 - block
    b570 - block
    b618 - block
    b344 - block
    b801 - block
    b201 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b858 )
    ( on b136 b858 )
    ( on b47 b136 )
    ( on b566 b47 )
    ( on b544 b566 )
    ( on b773 b544 )
    ( on b483 b773 )
    ( on b98 b483 )
    ( on b22 b98 )
    ( on b868 b22 )
    ( on b494 b868 )
    ( on b682 b494 )
    ( on b71 b682 )
    ( on b795 b71 )
    ( on b878 b795 )
    ( on b891 b878 )
    ( on b360 b891 )
    ( on b104 b360 )
    ( on b56 b104 )
    ( on b376 b56 )
    ( on b570 b376 )
    ( on b618 b570 )
    ( on b344 b618 )
    ( on b801 b344 )
    ( on b201 b801 )
    ( clear b201 )
  )
  ( :goal
    ( and
      ( clear b858 )
    )
  )
)
