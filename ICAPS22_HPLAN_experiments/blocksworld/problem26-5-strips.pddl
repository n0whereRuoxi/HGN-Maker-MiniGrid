( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b833 - block
    b282 - block
    b167 - block
    b26 - block
    b212 - block
    b475 - block
    b278 - block
    b717 - block
    b698 - block
    b807 - block
    b66 - block
    b417 - block
    b132 - block
    b446 - block
    b973 - block
    b674 - block
    b713 - block
    b415 - block
    b876 - block
    b777 - block
    b925 - block
    b685 - block
    b896 - block
    b518 - block
    b848 - block
    b707 - block
    b612 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b833 )
    ( on b282 b833 )
    ( on b167 b282 )
    ( on b26 b167 )
    ( on b212 b26 )
    ( on b475 b212 )
    ( on b278 b475 )
    ( on b717 b278 )
    ( on b698 b717 )
    ( on b807 b698 )
    ( on b66 b807 )
    ( on b417 b66 )
    ( on b132 b417 )
    ( on b446 b132 )
    ( on b973 b446 )
    ( on b674 b973 )
    ( on b713 b674 )
    ( on b415 b713 )
    ( on b876 b415 )
    ( on b777 b876 )
    ( on b925 b777 )
    ( on b685 b925 )
    ( on b896 b685 )
    ( on b518 b896 )
    ( on b848 b518 )
    ( on b707 b848 )
    ( on b612 b707 )
    ( clear b612 )
  )
  ( :goal
    ( and
      ( clear b833 )
    )
  )
)
