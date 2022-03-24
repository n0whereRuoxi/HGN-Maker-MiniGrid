( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b428 - block
    b36 - block
    b68 - block
    b491 - block
    b265 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b428 )
    ( on b36 b428 )
    ( on b68 b36 )
    ( on b491 b68 )
    ( on b265 b491 )
    ( clear b265 )
  )
  ( :tasks
    ( Make-4Pile b36 b68 b491 b265 )
  )
)
