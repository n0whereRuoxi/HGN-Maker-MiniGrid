( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b826 - block
    b118 - block
    b991 - block
    b432 - block
    b496 - block
    b11 - block
    b902 - block
    b645 - block
    b922 - block
    b81 - block
    b802 - block
    b391 - block
    b559 - block
    b693 - block
    b165 - block
    b147 - block
    b583 - block
    b8 - block
    b95 - block
    b155 - block
    b85 - block
    b758 - block
    b341 - block
    b171 - block
    b167 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b826 )
    ( on b118 b826 )
    ( on b991 b118 )
    ( on b432 b991 )
    ( on b496 b432 )
    ( on b11 b496 )
    ( on b902 b11 )
    ( on b645 b902 )
    ( on b922 b645 )
    ( on b81 b922 )
    ( on b802 b81 )
    ( on b391 b802 )
    ( on b559 b391 )
    ( on b693 b559 )
    ( on b165 b693 )
    ( on b147 b165 )
    ( on b583 b147 )
    ( on b8 b583 )
    ( on b95 b8 )
    ( on b155 b95 )
    ( on b85 b155 )
    ( on b758 b85 )
    ( on b341 b758 )
    ( on b171 b341 )
    ( on b167 b171 )
    ( clear b167 )
  )
  ( :goal
    ( and
      ( clear b826 )
    )
  )
)
