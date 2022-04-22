( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b219 - block
    b163 - block
    b697 - block
    b156 - block
    b708 - block
    b263 - block
    b404 - block
    b801 - block
    b249 - block
    b914 - block
    b341 - block
    b650 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b219 )
    ( on b163 b219 )
    ( on b697 b163 )
    ( on b156 b697 )
    ( on b708 b156 )
    ( on b263 b708 )
    ( on b404 b263 )
    ( on b801 b404 )
    ( on b249 b801 )
    ( on b914 b249 )
    ( on b341 b914 )
    ( on b650 b341 )
    ( clear b650 )
  )
  ( :goal
    ( and
      ( clear b219 )
    )
  )
)
