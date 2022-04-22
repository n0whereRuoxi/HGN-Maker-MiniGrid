( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b449 - block
    b858 - block
    b702 - block
    b250 - block
    b308 - block
    b657 - block
    b30 - block
    b616 - block
    b233 - block
    b269 - block
    b73 - block
    b424 - block
    b882 - block
    b694 - block
    b45 - block
    b166 - block
    b461 - block
    b868 - block
    b142 - block
    b805 - block
    b744 - block
    b374 - block
    b788 - block
    b809 - block
    b662 - block
    b368 - block
    b320 - block
    b383 - block
    b386 - block
    b746 - block
    b605 - block
    b414 - block
    b935 - block
    b121 - block
    b182 - block
    b603 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b449 )
    ( on b858 b449 )
    ( on b702 b858 )
    ( on b250 b702 )
    ( on b308 b250 )
    ( on b657 b308 )
    ( on b30 b657 )
    ( on b616 b30 )
    ( on b233 b616 )
    ( on b269 b233 )
    ( on b73 b269 )
    ( on b424 b73 )
    ( on b882 b424 )
    ( on b694 b882 )
    ( on b45 b694 )
    ( on b166 b45 )
    ( on b461 b166 )
    ( on b868 b461 )
    ( on b142 b868 )
    ( on b805 b142 )
    ( on b744 b805 )
    ( on b374 b744 )
    ( on b788 b374 )
    ( on b809 b788 )
    ( on b662 b809 )
    ( on b368 b662 )
    ( on b320 b368 )
    ( on b383 b320 )
    ( on b386 b383 )
    ( on b746 b386 )
    ( on b605 b746 )
    ( on b414 b605 )
    ( on b935 b414 )
    ( on b121 b935 )
    ( on b182 b121 )
    ( on b603 b182 )
    ( clear b603 )
  )
  ( :goal
    ( and
      ( clear b449 )
    )
  )
)
