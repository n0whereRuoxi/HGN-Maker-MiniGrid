( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b644 - block
    b953 - block
    b528 - block
    b514 - block
    b124 - block
    b330 - block
    b404 - block
    b263 - block
    b901 - block
    b782 - block
    b182 - block
    b805 - block
    b694 - block
    b747 - block
    b374 - block
    b167 - block
    b848 - block
    b681 - block
    b16 - block
    b702 - block
    b993 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b644 )
    ( on b953 b644 )
    ( on b528 b953 )
    ( on b514 b528 )
    ( on b124 b514 )
    ( on b330 b124 )
    ( on b404 b330 )
    ( on b263 b404 )
    ( on b901 b263 )
    ( on b782 b901 )
    ( on b182 b782 )
    ( on b805 b182 )
    ( on b694 b805 )
    ( on b747 b694 )
    ( on b374 b747 )
    ( on b167 b374 )
    ( on b848 b167 )
    ( on b681 b848 )
    ( on b16 b681 )
    ( on b702 b16 )
    ( on b993 b702 )
    ( clear b993 )
  )
  ( :goal
    ( and
      ( clear b644 )
    )
  )
)
