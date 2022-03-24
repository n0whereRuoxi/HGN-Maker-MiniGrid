( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b706 - block
    b762 - block
    b375 - block
    b305 - block
    b485 - block
    b659 - block
    b646 - block
    b396 - block
    b690 - block
    b814 - block
    b628 - block
    b315 - block
    b765 - block
    b58 - block
    b899 - block
    b401 - block
    b783 - block
    b777 - block
    b558 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b706 )
    ( on b762 b706 )
    ( on b375 b762 )
    ( on b305 b375 )
    ( on b485 b305 )
    ( on b659 b485 )
    ( on b646 b659 )
    ( on b396 b646 )
    ( on b690 b396 )
    ( on b814 b690 )
    ( on b628 b814 )
    ( on b315 b628 )
    ( on b765 b315 )
    ( on b58 b765 )
    ( on b899 b58 )
    ( on b401 b899 )
    ( on b783 b401 )
    ( on b777 b783 )
    ( on b558 b777 )
    ( clear b558 )
  )
  ( :goal
    ( and
      ( clear b706 )
    )
  )
)
