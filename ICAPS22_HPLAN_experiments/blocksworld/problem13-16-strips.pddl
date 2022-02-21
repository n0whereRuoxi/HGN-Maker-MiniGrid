( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b480 - block
    b755 - block
    b380 - block
    b73 - block
    b661 - block
    b316 - block
    b988 - block
    b930 - block
    b146 - block
    b878 - block
    b850 - block
    b185 - block
    b111 - block
    b472 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b480 )
    ( on b755 b480 )
    ( on b380 b755 )
    ( on b73 b380 )
    ( on b661 b73 )
    ( on b316 b661 )
    ( on b988 b316 )
    ( on b930 b988 )
    ( on b146 b930 )
    ( on b878 b146 )
    ( on b850 b878 )
    ( on b185 b850 )
    ( on b111 b185 )
    ( on b472 b111 )
    ( clear b472 )
  )
  ( :goal
    ( and
      ( clear b480 )
    )
  )
)
