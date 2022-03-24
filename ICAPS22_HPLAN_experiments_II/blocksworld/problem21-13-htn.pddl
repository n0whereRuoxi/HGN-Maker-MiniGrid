( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b706 - block
    b797 - block
    b958 - block
    b189 - block
    b81 - block
    b864 - block
    b79 - block
    b744 - block
    b541 - block
    b364 - block
    b310 - block
    b484 - block
    b215 - block
    b313 - block
    b766 - block
    b963 - block
    b658 - block
    b804 - block
    b114 - block
    b155 - block
    b64 - block
    b128 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b706 )
    ( on b797 b706 )
    ( on b958 b797 )
    ( on b189 b958 )
    ( on b81 b189 )
    ( on b864 b81 )
    ( on b79 b864 )
    ( on b744 b79 )
    ( on b541 b744 )
    ( on b364 b541 )
    ( on b310 b364 )
    ( on b484 b310 )
    ( on b215 b484 )
    ( on b313 b215 )
    ( on b766 b313 )
    ( on b963 b766 )
    ( on b658 b963 )
    ( on b804 b658 )
    ( on b114 b804 )
    ( on b155 b114 )
    ( on b64 b155 )
    ( on b128 b64 )
    ( clear b128 )
  )
  ( :tasks
    ( Make-21Pile b797 b958 b189 b81 b864 b79 b744 b541 b364 b310 b484 b215 b313 b766 b963 b658 b804 b114 b155 b64 b128 )
  )
)
