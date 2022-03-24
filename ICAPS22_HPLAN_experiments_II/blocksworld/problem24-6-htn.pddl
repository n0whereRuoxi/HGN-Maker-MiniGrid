( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b169 - block
    b363 - block
    b983 - block
    b839 - block
    b495 - block
    b133 - block
    b112 - block
    b887 - block
    b540 - block
    b435 - block
    b467 - block
    b265 - block
    b617 - block
    b746 - block
    b232 - block
    b251 - block
    b242 - block
    b404 - block
    b167 - block
    b882 - block
    b574 - block
    b489 - block
    b481 - block
    b867 - block
    b941 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b169 )
    ( on b363 b169 )
    ( on b983 b363 )
    ( on b839 b983 )
    ( on b495 b839 )
    ( on b133 b495 )
    ( on b112 b133 )
    ( on b887 b112 )
    ( on b540 b887 )
    ( on b435 b540 )
    ( on b467 b435 )
    ( on b265 b467 )
    ( on b617 b265 )
    ( on b746 b617 )
    ( on b232 b746 )
    ( on b251 b232 )
    ( on b242 b251 )
    ( on b404 b242 )
    ( on b167 b404 )
    ( on b882 b167 )
    ( on b574 b882 )
    ( on b489 b574 )
    ( on b481 b489 )
    ( on b867 b481 )
    ( on b941 b867 )
    ( clear b941 )
  )
  ( :tasks
    ( Make-24Pile b363 b983 b839 b495 b133 b112 b887 b540 b435 b467 b265 b617 b746 b232 b251 b242 b404 b167 b882 b574 b489 b481 b867 b941 )
  )
)
