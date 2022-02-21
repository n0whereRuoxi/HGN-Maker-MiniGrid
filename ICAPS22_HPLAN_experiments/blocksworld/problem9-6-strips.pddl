( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b319 - block
    b266 - block
    b77 - block
    b322 - block
    b506 - block
    b879 - block
    b811 - block
    b337 - block
    b187 - block
    b396 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b319 )
    ( on b266 b319 )
    ( on b77 b266 )
    ( on b322 b77 )
    ( on b506 b322 )
    ( on b879 b506 )
    ( on b811 b879 )
    ( on b337 b811 )
    ( on b187 b337 )
    ( on b396 b187 )
    ( clear b396 )
  )
  ( :goal
    ( and
      ( clear b319 )
    )
  )
)
