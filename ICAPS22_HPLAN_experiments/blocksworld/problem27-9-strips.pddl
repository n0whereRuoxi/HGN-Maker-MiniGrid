( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b891 - block
    b86 - block
    b625 - block
    b324 - block
    b9 - block
    b259 - block
    b398 - block
    b390 - block
    b613 - block
    b565 - block
    b732 - block
    b633 - block
    b793 - block
    b488 - block
    b330 - block
    b297 - block
    b57 - block
    b658 - block
    b191 - block
    b693 - block
    b310 - block
    b28 - block
    b80 - block
    b250 - block
    b27 - block
    b476 - block
    b428 - block
    b451 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b891 )
    ( on b86 b891 )
    ( on b625 b86 )
    ( on b324 b625 )
    ( on b9 b324 )
    ( on b259 b9 )
    ( on b398 b259 )
    ( on b390 b398 )
    ( on b613 b390 )
    ( on b565 b613 )
    ( on b732 b565 )
    ( on b633 b732 )
    ( on b793 b633 )
    ( on b488 b793 )
    ( on b330 b488 )
    ( on b297 b330 )
    ( on b57 b297 )
    ( on b658 b57 )
    ( on b191 b658 )
    ( on b693 b191 )
    ( on b310 b693 )
    ( on b28 b310 )
    ( on b80 b28 )
    ( on b250 b80 )
    ( on b27 b250 )
    ( on b476 b27 )
    ( on b428 b476 )
    ( on b451 b428 )
    ( clear b451 )
  )
  ( :goal
    ( and
      ( clear b891 )
    )
  )
)
