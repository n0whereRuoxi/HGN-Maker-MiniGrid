( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b144 - block
    b90 - block
    b700 - block
    b991 - block
    b712 - block
    b864 - block
    b963 - block
    b919 - block
    b344 - block
    b950 - block
    b285 - block
    b383 - block
    b852 - block
    b411 - block
    b256 - block
    b793 - block
    b694 - block
    b171 - block
    b9 - block
    b804 - block
    b687 - block
    b917 - block
    b423 - block
    b318 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b144 )
    ( on b90 b144 )
    ( on b700 b90 )
    ( on b991 b700 )
    ( on b712 b991 )
    ( on b864 b712 )
    ( on b963 b864 )
    ( on b919 b963 )
    ( on b344 b919 )
    ( on b950 b344 )
    ( on b285 b950 )
    ( on b383 b285 )
    ( on b852 b383 )
    ( on b411 b852 )
    ( on b256 b411 )
    ( on b793 b256 )
    ( on b694 b793 )
    ( on b171 b694 )
    ( on b9 b171 )
    ( on b804 b9 )
    ( on b687 b804 )
    ( on b917 b687 )
    ( on b423 b917 )
    ( on b318 b423 )
    ( clear b318 )
  )
  ( :goal
    ( and
      ( clear b144 )
    )
  )
)
