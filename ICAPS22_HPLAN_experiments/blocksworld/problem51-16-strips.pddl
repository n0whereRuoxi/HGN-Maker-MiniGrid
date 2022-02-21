( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b212 - block
    b354 - block
    b979 - block
    b159 - block
    b701 - block
    b919 - block
    b825 - block
    b402 - block
    b909 - block
    b967 - block
    b815 - block
    b306 - block
    b708 - block
    b334 - block
    b457 - block
    b439 - block
    b997 - block
    b298 - block
    b890 - block
    b580 - block
    b97 - block
    b727 - block
    b952 - block
    b640 - block
    b894 - block
    b707 - block
    b5 - block
    b603 - block
    b504 - block
    b732 - block
    b568 - block
    b392 - block
    b756 - block
    b822 - block
    b366 - block
    b914 - block
    b350 - block
    b170 - block
    b637 - block
    b94 - block
    b359 - block
    b858 - block
    b269 - block
    b87 - block
    b117 - block
    b384 - block
    b548 - block
    b940 - block
    b884 - block
    b778 - block
    b907 - block
    b854 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b212 )
    ( on b354 b212 )
    ( on b979 b354 )
    ( on b159 b979 )
    ( on b701 b159 )
    ( on b919 b701 )
    ( on b825 b919 )
    ( on b402 b825 )
    ( on b909 b402 )
    ( on b967 b909 )
    ( on b815 b967 )
    ( on b306 b815 )
    ( on b708 b306 )
    ( on b334 b708 )
    ( on b457 b334 )
    ( on b439 b457 )
    ( on b997 b439 )
    ( on b298 b997 )
    ( on b890 b298 )
    ( on b580 b890 )
    ( on b97 b580 )
    ( on b727 b97 )
    ( on b952 b727 )
    ( on b640 b952 )
    ( on b894 b640 )
    ( on b707 b894 )
    ( on b5 b707 )
    ( on b603 b5 )
    ( on b504 b603 )
    ( on b732 b504 )
    ( on b568 b732 )
    ( on b392 b568 )
    ( on b756 b392 )
    ( on b822 b756 )
    ( on b366 b822 )
    ( on b914 b366 )
    ( on b350 b914 )
    ( on b170 b350 )
    ( on b637 b170 )
    ( on b94 b637 )
    ( on b359 b94 )
    ( on b858 b359 )
    ( on b269 b858 )
    ( on b87 b269 )
    ( on b117 b87 )
    ( on b384 b117 )
    ( on b548 b384 )
    ( on b940 b548 )
    ( on b884 b940 )
    ( on b778 b884 )
    ( on b907 b778 )
    ( on b854 b907 )
    ( clear b854 )
  )
  ( :goal
    ( and
      ( clear b212 )
    )
  )
)
