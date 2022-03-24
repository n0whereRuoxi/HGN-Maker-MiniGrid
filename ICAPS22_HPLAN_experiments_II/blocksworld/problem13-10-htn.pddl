( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b771 - block
    b537 - block
    b17 - block
    b378 - block
    b173 - block
    b169 - block
    b676 - block
    b323 - block
    b60 - block
    b566 - block
    b818 - block
    b209 - block
    b637 - block
    b432 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b771 )
    ( on b537 b771 )
    ( on b17 b537 )
    ( on b378 b17 )
    ( on b173 b378 )
    ( on b169 b173 )
    ( on b676 b169 )
    ( on b323 b676 )
    ( on b60 b323 )
    ( on b566 b60 )
    ( on b818 b566 )
    ( on b209 b818 )
    ( on b637 b209 )
    ( on b432 b637 )
    ( clear b432 )
  )
  ( :tasks
    ( Make-13Pile b537 b17 b378 b173 b169 b676 b323 b60 b566 b818 b209 b637 b432 )
  )
)
