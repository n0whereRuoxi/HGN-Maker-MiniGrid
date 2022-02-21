( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b261 - block
    b972 - block
    b202 - block
    b804 - block
    b82 - block
    b150 - block
    b784 - block
    b616 - block
    b802 - block
    b699 - block
    b63 - block
    b152 - block
    b240 - block
    b100 - block
    b653 - block
    b736 - block
    b30 - block
    b508 - block
    b266 - block
    b40 - block
    b183 - block
    b246 - block
    b289 - block
    b940 - block
    b928 - block
    b394 - block
    b27 - block
    b688 - block
    b876 - block
    b930 - block
    b525 - block
    b339 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b261 )
    ( on b972 b261 )
    ( on b202 b972 )
    ( on b804 b202 )
    ( on b82 b804 )
    ( on b150 b82 )
    ( on b784 b150 )
    ( on b616 b784 )
    ( on b802 b616 )
    ( on b699 b802 )
    ( on b63 b699 )
    ( on b152 b63 )
    ( on b240 b152 )
    ( on b100 b240 )
    ( on b653 b100 )
    ( on b736 b653 )
    ( on b30 b736 )
    ( on b508 b30 )
    ( on b266 b508 )
    ( on b40 b266 )
    ( on b183 b40 )
    ( on b246 b183 )
    ( on b289 b246 )
    ( on b940 b289 )
    ( on b928 b940 )
    ( on b394 b928 )
    ( on b27 b394 )
    ( on b688 b27 )
    ( on b876 b688 )
    ( on b930 b876 )
    ( on b525 b930 )
    ( on b339 b525 )
    ( clear b339 )
  )
  ( :goal
    ( and
      ( clear b261 )
    )
  )
)
