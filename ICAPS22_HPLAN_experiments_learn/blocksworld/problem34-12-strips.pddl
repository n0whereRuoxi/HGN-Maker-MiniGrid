( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b913 - block
    b750 - block
    b558 - block
    b811 - block
    b929 - block
    b265 - block
    b171 - block
    b961 - block
    b110 - block
    b723 - block
    b121 - block
    b493 - block
    b604 - block
    b999 - block
    b789 - block
    b727 - block
    b439 - block
    b871 - block
    b346 - block
    b892 - block
    b543 - block
    b222 - block
    b423 - block
    b496 - block
    b718 - block
    b135 - block
    b652 - block
    b957 - block
    b566 - block
    b198 - block
    b396 - block
    b6 - block
    b878 - block
    b624 - block
    b880 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b913 )
    ( on b750 b913 )
    ( on b558 b750 )
    ( on b811 b558 )
    ( on b929 b811 )
    ( on b265 b929 )
    ( on b171 b265 )
    ( on b961 b171 )
    ( on b110 b961 )
    ( on b723 b110 )
    ( on b121 b723 )
    ( on b493 b121 )
    ( on b604 b493 )
    ( on b999 b604 )
    ( on b789 b999 )
    ( on b727 b789 )
    ( on b439 b727 )
    ( on b871 b439 )
    ( on b346 b871 )
    ( on b892 b346 )
    ( on b543 b892 )
    ( on b222 b543 )
    ( on b423 b222 )
    ( on b496 b423 )
    ( on b718 b496 )
    ( on b135 b718 )
    ( on b652 b135 )
    ( on b957 b652 )
    ( on b566 b957 )
    ( on b198 b566 )
    ( on b396 b198 )
    ( on b6 b396 )
    ( on b878 b6 )
    ( on b624 b878 )
    ( on b880 b624 )
    ( clear b880 )
  )
  ( :goal
    ( and
      ( clear b913 )
    )
  )
)
