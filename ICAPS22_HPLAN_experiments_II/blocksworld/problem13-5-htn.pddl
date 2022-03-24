( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b321 - block
    b421 - block
    b726 - block
    b633 - block
    b786 - block
    b228 - block
    b737 - block
    b46 - block
    b337 - block
    b968 - block
    b736 - block
    b698 - block
    b354 - block
    b675 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b321 )
    ( on b421 b321 )
    ( on b726 b421 )
    ( on b633 b726 )
    ( on b786 b633 )
    ( on b228 b786 )
    ( on b737 b228 )
    ( on b46 b737 )
    ( on b337 b46 )
    ( on b968 b337 )
    ( on b736 b968 )
    ( on b698 b736 )
    ( on b354 b698 )
    ( on b675 b354 )
    ( clear b675 )
  )
  ( :tasks
    ( Make-13Pile b421 b726 b633 b786 b228 b737 b46 b337 b968 b736 b698 b354 b675 )
  )
)
