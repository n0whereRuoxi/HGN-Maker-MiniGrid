( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b319 - block
    b415 - block
    b557 - block
    b503 - block
    b239 - block
    b864 - block
    b242 - block
    b871 - block
    b670 - block
    b867 - block
    b340 - block
    b800 - block
    b869 - block
    b500 - block
    b704 - block
    b868 - block
    b986 - block
    b261 - block
    b419 - block
    b144 - block
    b927 - block
    b5 - block
    b788 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b319 )
    ( on b415 b319 )
    ( on b557 b415 )
    ( on b503 b557 )
    ( on b239 b503 )
    ( on b864 b239 )
    ( on b242 b864 )
    ( on b871 b242 )
    ( on b670 b871 )
    ( on b867 b670 )
    ( on b340 b867 )
    ( on b800 b340 )
    ( on b869 b800 )
    ( on b500 b869 )
    ( on b704 b500 )
    ( on b868 b704 )
    ( on b986 b868 )
    ( on b261 b986 )
    ( on b419 b261 )
    ( on b144 b419 )
    ( on b927 b144 )
    ( on b5 b927 )
    ( on b788 b5 )
    ( clear b788 )
  )
  ( :goal
    ( and
      ( clear b319 )
    )
  )
)
