( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b941 - block
    b851 - block
    b205 - block
    b282 - block
    b360 - block
    b507 - block
    b641 - block
    b675 - block
    b901 - block
    b700 - block
    b38 - block
    b343 - block
    b850 - block
    b65 - block
    b949 - block
    b88 - block
    b931 - block
    b885 - block
    b424 - block
    b903 - block
    b113 - block
    b533 - block
    b200 - block
    b616 - block
    b356 - block
    b132 - block
    b499 - block
    b308 - block
    b935 - block
    b201 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b941 )
    ( on b851 b941 )
    ( on b205 b851 )
    ( on b282 b205 )
    ( on b360 b282 )
    ( on b507 b360 )
    ( on b641 b507 )
    ( on b675 b641 )
    ( on b901 b675 )
    ( on b700 b901 )
    ( on b38 b700 )
    ( on b343 b38 )
    ( on b850 b343 )
    ( on b65 b850 )
    ( on b949 b65 )
    ( on b88 b949 )
    ( on b931 b88 )
    ( on b885 b931 )
    ( on b424 b885 )
    ( on b903 b424 )
    ( on b113 b903 )
    ( on b533 b113 )
    ( on b200 b533 )
    ( on b616 b200 )
    ( on b356 b616 )
    ( on b132 b356 )
    ( on b499 b132 )
    ( on b308 b499 )
    ( on b935 b308 )
    ( on b201 b935 )
    ( clear b201 )
  )
  ( :goal
    ( and
      ( clear b941 )
    )
  )
)
