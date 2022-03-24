( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b895 - block
    b926 - block
    b657 - block
    b95 - block
    b722 - block
    b554 - block
    b974 - block
    b919 - block
    b453 - block
    b811 - block
    b179 - block
    b378 - block
    b380 - block
    b892 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b895 )
    ( on b926 b895 )
    ( on b657 b926 )
    ( on b95 b657 )
    ( on b722 b95 )
    ( on b554 b722 )
    ( on b974 b554 )
    ( on b919 b974 )
    ( on b453 b919 )
    ( on b811 b453 )
    ( on b179 b811 )
    ( on b378 b179 )
    ( on b380 b378 )
    ( on b892 b380 )
    ( clear b892 )
  )
  ( :goal
    ( and
      ( clear b895 )
    )
  )
)
