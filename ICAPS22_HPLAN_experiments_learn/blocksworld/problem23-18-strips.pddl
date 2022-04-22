( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b54 - block
    b42 - block
    b19 - block
    b784 - block
    b655 - block
    b32 - block
    b829 - block
    b918 - block
    b689 - block
    b194 - block
    b979 - block
    b980 - block
    b129 - block
    b579 - block
    b710 - block
    b188 - block
    b395 - block
    b295 - block
    b634 - block
    b732 - block
    b987 - block
    b452 - block
    b932 - block
    b756 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b54 )
    ( on b42 b54 )
    ( on b19 b42 )
    ( on b784 b19 )
    ( on b655 b784 )
    ( on b32 b655 )
    ( on b829 b32 )
    ( on b918 b829 )
    ( on b689 b918 )
    ( on b194 b689 )
    ( on b979 b194 )
    ( on b980 b979 )
    ( on b129 b980 )
    ( on b579 b129 )
    ( on b710 b579 )
    ( on b188 b710 )
    ( on b395 b188 )
    ( on b295 b395 )
    ( on b634 b295 )
    ( on b732 b634 )
    ( on b987 b732 )
    ( on b452 b987 )
    ( on b932 b452 )
    ( on b756 b932 )
    ( clear b756 )
  )
  ( :goal
    ( and
      ( clear b54 )
    )
  )
)
