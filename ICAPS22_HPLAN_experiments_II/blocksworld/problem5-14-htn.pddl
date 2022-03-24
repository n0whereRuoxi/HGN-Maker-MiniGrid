( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b404 - block
    b172 - block
    b244 - block
    b214 - block
    b692 - block
    b637 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b404 )
    ( on b172 b404 )
    ( on b244 b172 )
    ( on b214 b244 )
    ( on b692 b214 )
    ( on b637 b692 )
    ( clear b637 )
  )
  ( :tasks
    ( Make-5Pile b172 b244 b214 b692 b637 )
  )
)
